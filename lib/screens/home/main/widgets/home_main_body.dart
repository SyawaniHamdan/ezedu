import 'package:flutter/material.dart';

class HomeMainBody extends StatelessWidget {
  static const rightColor = Color(0xFF7f53ac);
  static const leftColor = Color(0xFF647dee);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [rightColor, leftColor])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 80, 30, 10),
                child: Image.asset('assets/images/logo_ezEdu.png'),
              )
            ],
          ),
        ));
  }
}
