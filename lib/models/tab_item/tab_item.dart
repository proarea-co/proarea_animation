import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class TabItem {
  final String Function(BuildContext context) name;
  final IconData icon;
  final PageRouteInfo<dynamic> rout;

  const TabItem(
    this.name,
    this.icon,
    this.rout,
  );
}
