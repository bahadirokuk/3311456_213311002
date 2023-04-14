import 'package:flutter/material.dart';
@immutable
class Background {
  const Background._();
  static backgroung(index) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(index),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.white.withOpacity(0.8),
          BlendMode.screen,
        ),
      ),
    );
  }
}
