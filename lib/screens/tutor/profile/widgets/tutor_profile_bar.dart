import 'package:flutter/material.dart';

class TutorProfileBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
        return AppBar(
          title: Text('My Notes'),
        );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}