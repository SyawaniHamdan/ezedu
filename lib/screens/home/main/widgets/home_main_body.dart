import 'package:flutter/material.dart';

class HomeMainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.lightBlue.shade900, Colors.cyan.shade900]
              )
              ),
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
      )
    );
  }
}