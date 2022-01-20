//import 'package:ez_edu/templates/templateMenu.dart';
import 'package:ezedu/templates/templateMenu.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const primaryColor = Color.fromARGB(255, 94, 255, 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PROJECT',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: templateMenu(),
    );
  }
}
