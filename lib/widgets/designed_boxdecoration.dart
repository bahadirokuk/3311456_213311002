import 'package:flutter/material.dart';

@immutable
class DesignedBoxDecoraiton {
  const DesignedBoxDecoraiton._();

  static BoxDecoration designedBoxDecoraiton = const BoxDecoration(
    boxShadow: [
      BoxShadow(color: Colors.grey, blurRadius: 10.0, offset: Offset(3, 5)),
    ],
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(2, 1),
      colors: <Color>[Colors.white, Color.fromRGBO(198, 244, 249, 1)],
      tileMode: TileMode.mirror,
    ),
  );
}
