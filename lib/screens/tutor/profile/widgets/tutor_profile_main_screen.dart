import 'package:ezedu/screens/tutor/profile/widgets/tutor_profile_bar.dart';
import 'package:ezedu/screens/tutor/profile/widgets/tutor_profile_body.dart';
import 'package:ezedu/screens/tutor/profile/widgets/tutor_profile_bottom.dart';
import 'package:ezedu/screens/tutor/profile/widgets/tutor_profile_float.dart';
import 'package:flutter/material.dart';


class TutorProfileMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TutorProfileBar(),
      body: TutorProfileBody(),
      floatingActionButton: TutorProfileFloat(),
      bottomNavigationBar: TutorProfileBottom(),
    );
  }
}