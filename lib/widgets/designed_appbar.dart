import 'package:flutter/material.dart';
class DesignedAppBar extends StatelessWidget implements PreferredSizeWidget{
  DesignedAppBar({Key? key, required this.tittle, this.leading}) : super(key: key);
  final IconButton? leading;
  final String tittle;
  @override
  final Size preferredSize=_PreferredAppBarSize(17,40);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 70,
      leading:leading,
      title: Text(
        tittle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
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