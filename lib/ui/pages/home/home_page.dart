import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home/home_cubit.dart';
import '../../../bloc/settings/settings_cubit.dart';
import '../../../di/di.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/localization_helper.dart';
import '../../../models/tab_item/tab_item.dart';
import '../../../themes/extensions/app_menu_item_styles.dart';
import '../../../themes/app_theme.dart';
import '../../views/base_builders/app_builder.dart';
import 'components/app_menu_item.dart';
import 'components/home_swipe_detector.dart';
import 'components/tabs.dart';

class HomePage extends StatefulWidget with AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(create: (_) => locator()..init()),
        BlocProvider<HomeCubit>(create: (_) => locator())
      ],
      child: this,
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final _menuItemGroup = AutoSizeGroup();

  bool get _fullScreen => _animationController.value == 0;
  HomeCubit get _cubit => context.read<HomeCubit>();
  double get _getSlide {
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    return rightSlide * _animationController.value;
  }

  double get scale {
    return 1 - (_animationController.value * 0.12);
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      value: 1,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _toggleAnimation() {
    return _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  Future<bool> _onWillPop() async {
    _toggleAnimation();

    return !_fullScreen;
  }

  String _username(SettingsState state) {
    final username = state.settings.userName;

    if (username.isEmpty) return context.strings.guest;

    return username;
  }

  @override
  Widget build(BuildContext context) {
    return AppBuilder<HomeCubit, HomeState>(
      builder: (state) {
        return AutoTabsRouter(
          routes: HomeTabs.routes,
          builder: (context, child, animation) {
            return HomeSwipeDetector(
              setCanBeDragged: (dragged) {
                _cubit.setCanBeDragged(dragged);
              },
              animationController: _animationController,
              canBeDragged: state.canBeDragged,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (_, __) => _buildContent(state, child),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildContent(HomeState state, Widget child) {
    final extension = context.extension<AppMenuItemStyles>();
    return Container(
      color: extension?.backgroundColor,
      child: SafeArea(
        child: Stack(
          children: [
            _buildSideTab(state),
            _buildPage(child),
          ],
        ),
      ),
    );
  }

  Widget _buildSideTab(HomeState state) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 12),
      child: Column(
        children: [
          _buildHeading(),
          _buildDivider(),
          Expanded(child: _buildMenu(state)),
        ],
      ),
    );
  }

  Widget _buildHeading() {
    return AppBuilder<SettingsCubit, SettingsState>(
      withScaffold: false,
      withErrorBuilder: false,
      builder: (state) {
        return Row(
          children: [
            _buildUserAvatar(),
            const SizedBox(width: 16),
            Expanded(
              child: _buildUserName(state),
            ),
          ],
        );
      },
    );
  }

  Widget _buildUserAvatar() {
    return SizedBox(
      height: 48,
      width: 48,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(48),
        child: Image.asset(
          Assets.images.proareaAnimationsLogo.path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildUserName(SettingsState state) {
    return Text(
      _username(state),
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 36,
      color: Colors.white54,
    );
  }

  Widget _buildMenu(HomeState state) {
    final tabs = HomeTabs.tabs;
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      children: List.generate(tabs.length, (index) {
        final tab = tabs[index];
        return _buildMenuItem(tab, index);
      }),
    );
  }

  Widget _buildMenuItem(TabItem tab, int index) {
    return Builder(builder: (context) {
      final tabsRouter = AutoTabsRouter.of(context);
      final current = tabsRouter.activeIndex == index;
      return AppMenuItem(
        selected: current,
        group: _menuItemGroup,
        routeItem: tab,
        onTap: () async {
          tabsRouter.setActiveIndex(index);
          await Future.delayed(const Duration(milliseconds: 300));
          _toggleAnimation();
        },
      );
    });
  }

  Widget _buildPage(Widget child) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Transform(
        transform: Matrix4.identity()
          ..translate(_getSlide)
          ..scale(scale),
        alignment: Alignment.centerLeft,
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(4.0),
          child: child,
        ),
      ),
    );
  }
}
