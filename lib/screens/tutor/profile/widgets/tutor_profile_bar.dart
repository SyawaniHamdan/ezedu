import 'package:flutter/material.dart';

class TutorProfileBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
        return AppBar(
          backgroundColor: Color(0xFF006064),
          centerTitle: true,
          title: Text('Profile Dashboard'),
          leading: new IconButton(
          icon: new Icon(Icons.arrow_back_outlined),
          onPressed: () {},
        ),
          flexibleSpace: Container(
           decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.lightBlue.shade900, Colors.cyan.shade900]
              )
              ),
          )
        );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}