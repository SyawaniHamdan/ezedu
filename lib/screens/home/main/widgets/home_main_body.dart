import 'package:flutter/material.dart';

class HomeMainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,              
            children: <Widget>[ 
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Image.asset('assets/images/logo.png'),  
              )
            ],  
          ),  
    );
  }
}