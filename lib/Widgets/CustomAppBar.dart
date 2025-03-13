import 'package:flutter/material.dart';
import 'package:untitled7/helper/constans.dart';

 class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize =>const  Size.fromHeight(kToolbarHeight);

  CustomAppBar({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      flexibleSpace: Container(
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            colors: [kColorPrimer, kColorSecond],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
     
     
    );
  }


}