import 'package:flutter/material.dart';

void main() {
  runApp(templatePlain());
}

class templatePlain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: Text(
              'Home',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ))));
  }
}
