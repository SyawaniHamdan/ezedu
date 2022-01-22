import 'package:ezedu/screens/tutor/menu/tutor_menu.dart';
import 'package:flutter/material.dart';

class TutorProfileBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
        return AppBar(
          backgroundColor: const Color(0xFF006064),
          centerTitle: true,
          title: Text('Profile Dashboard'),
          leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                tutorMainMenu(),
          ),
        );
          },
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