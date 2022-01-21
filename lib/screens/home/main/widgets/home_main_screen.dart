import 'package:flutter/material.dart';

import 'home_main_body.dart';
import 'home_main_float.dart';

class HomeMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeMainBody(),
      floatingActionButton: HomeMainFloat(),
    );
  }
}