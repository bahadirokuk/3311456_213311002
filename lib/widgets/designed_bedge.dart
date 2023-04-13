import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
class DesignedBadge extends StatelessWidget {
  const DesignedBadge({Key? key, required this.child, required this.content}) : super(key: key);
  final Widget child;
  final int content;
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeContent: Text(content.toString()),
      badgeStyle: const badges.BadgeStyle(
          badgeGradient: badges.BadgeGradient.linear(
              colors: [Colors.orangeAccent, Colors.orange],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)),
      child: child
    );
  }
}
