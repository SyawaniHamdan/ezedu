//import 'package:ez_edu/templates/templateMenu.dart';
import 'package:ezedu/routes.dart';
import 'package:ezedu/screens/tutor/register/widgets/tutor_register_view.dart';
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
      initialRoute: '/',
       onGenerateRoute: Routes.createRoute,
      //home: TutorRegistration(),
    );
  }
}
