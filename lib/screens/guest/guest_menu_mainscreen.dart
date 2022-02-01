import 'package:ezedu/screens/guest/guest_menu_appbar.dart';
import 'package:ezedu/screens/guest/guest_menu_body.dart';
import 'package:ezedu/screens/home/main/widgets/home_main_body.dart';
import 'package:flutter/material.dart';


class GuestMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuestMenuAppBar(),
      body: GuestMenuBody(),
    );
  }
}