import 'package:flutter/material.dart';

import '../../../../models/user.dart';
import '../../../../themes/theme_app.dart';
import 'address_item_view.dart';
import 'fade_in_item_view.dart';

class UserDetailsView extends StatefulWidget {
  final User user;

  const UserDetailsView({
    super.key,
    required this.user,
  });

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  late List<GlobalKey<FadeInItemViewState>> _keys;

  @override
  void initState() {
    super.initState();
    _keys = List.generate(9, (_) => GlobalKey<FadeInItemViewState>());
    onInit();
  }

  void onInit() async {
    for (GlobalKey<FadeInItemViewState> key in _keys) {
      await Future.delayed(const Duration(milliseconds: 40));
      if (key.currentState?.mounted == true) {
        key.currentState?.show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: ((context, orientation) {
      if (orientation == Orientation.landscape) {
        return Row(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: _buildPersonalInfo(),
            )),
            Expanded(
                child: SingleChildScrollView(
              child: _buildAddressInfo(),
            )),
          ],
        );
      }
      return ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 32),
          _buildPersonalInfo(),
          const SizedBox(height: 16),
          _buildAddressInfo(),
          const SizedBox(height: 64),
        ],
      );
    }));
  }

  Widget _buildPersonalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPersonalInfoItem(0, widget.user.name),
        _buildPersonalInfoItem(1, widget.user.email),
        _buildPersonalInfoItem(2, widget.user.username),
        _buildPersonalInfoItem(3, widget.user.phone),
        _buildPersonalInfoItem(4, widget.user.company.name),
      ],
    );
  }

  Widget _buildAddressInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAddressInfoItem(5, widget.user.address.city),
        _buildAddressInfoItem(6, widget.user.address.street),
        _buildAddressInfoItem(7, widget.user.address.suite),
        _buildAddressInfoItem(8, widget.user.address.zipCode),
      ],
    );
  }

  FadeInItemView _buildAddressInfoItem(int keyIndex, String text) {
    return FadeInItemView(
      key: _keys[keyIndex],
      child: AddressItemView(text: text),
    );
  }

  Widget _buildPersonalInfoItem(int keyIndex, String question) {
    return FadeInItemView(
      key: _keys[keyIndex],
      child: Padding(
        padding: const EdgeInsets.only(left: 64, right: 16),
        child: Text(
          question,
          style: context.textTheme.subtitle1?.copyWith(
            color: context.colorScheme.primaryContainer,
          ),
        ),
      ),
    );
  }
}
