import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/dio/dio_constants.dart';
import '../../../bloc/home/home_cubit.dart';
import '../../../di/di.dart';
import '../../../l10n/localization_helper.dart';
import '../../../models/tab_item/tab_item.dart';
import '../../../routes/router.dart';
import '../../views/base_builders/app_builder.dart';
import 'components/app_menu_item.dart';

class HomePage extends StatefulWidget with AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => locator()..setTabs(_tabs(context)),
      child: this,
    );
  }

  List<TabItem> _tabs(BuildContext context) => [
        TabItem(
          context.strings.posts,
          Icons.article,
          const PostsRoute(),
        ),
        TabItem(
          context.strings.userList,
          Icons.account_circle,
          const UsersRoute(),
        ),
      ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  HomeCubit get _cubit => context.read<HomeCubit>();

  @override
  void initState() {
    super.initState();

    _cubit.setController(
      AnimationController(
        vsync: this,
        value: 1,
        duration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  void dispose() async {
    await _cubit.close();
    super.dispose();
  }

  Future<void> _toggleAnimation() {
    return _cubit.toggleAnimation();
  }

  void _onDragStart(DragStartDetails details) {
    _cubit.onDragStart(context, details);
  }

  void _onDragUpdate(DragUpdateDetails details) {
    _cubit.onDragUpdate(context, details);
  }

  void _onDragEnd(DragEndDetails details) {
    _cubit.onDragEnd(context, details);
  }

  Future<bool> _onWillPop() async {
    final fullScreen = _cubit.fullScreen;

    if (fullScreen) _toggleAnimation();

    return !fullScreen;
  }

  @override
  Widget build(BuildContext context) {
    return AppBuilder<HomeCubit, HomeState>(
      builder: (state) {
        return AutoTabsRouter(
          routes: state.routes,
          builder: (context, child, animation) {
            return GestureDetector(
              onHorizontalDragStart: _onDragStart,
              onHorizontalDragEnd: _onDragEnd,
              onHorizontalDragUpdate: _onDragUpdate,
              child: AnimatedBuilder(
                  animation: _cubit.animation,
                  builder: (_, __) {
                    return Stack(
                      children: [
                        _buildSideTab(state),
                        _buildPage(child),
                      ],
                    );
                  }),
            );
          },
        );
      },
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
    return Builder(
      builder: (context) {
        return Row(
          children: [
            SizedBox(
              height: 48,
              width: 48,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: Image.network(
                  ApiConstants.photosUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              context.strings.flutterDev,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        );
      },
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 36,
      color: Colors.white54,
    );
  }

  Widget _buildMenu(HomeState state) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      children: List.generate(state.tabs.length, (index) {
        final tab = state.tabs[index];
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
    final rightSlide = MediaQuery.of(context).size.width * 0.6;
    final controller = _cubit.controller;
    double slide = rightSlide * controller.value;
    double scale = 1 - (controller.value * 0.12);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Transform(
        transform: Matrix4.identity()
          ..translate(slide)
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
