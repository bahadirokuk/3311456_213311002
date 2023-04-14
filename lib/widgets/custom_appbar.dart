import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, required this.tittle, this.leading,required this.actions}) : super(key: key);
  final IconButton? leading;
  final List<Widget> actions;
  final String tittle;
  @override
  final Size preferredSize = _PreferredAppBarSize(17, 40);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leading,
      title: Text(
        tittle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromRGBO(198, 244, 249, 100), Colors.black12],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
      ),
    );
  }
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
