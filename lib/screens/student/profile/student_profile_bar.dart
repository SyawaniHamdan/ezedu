import 'package:ezedu/screens/student/login/students/student_login_viewmodel.dart';
import 'package:ezedu/screens/student/tab/student_tab.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StudentProfileBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
        return ViewModelBuilder<StudentLoginViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => StudentLoginViewModel(),
        // onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => AppBar(
          backgroundColor: const Color(0xFF006064),
          centerTitle: true,
          title:const Text('Profile Dashboard'),
          leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                StudentTab(),
          ),
        );
          },
        ),
          flexibleSpace: Container(
           decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.lightBlue.shade900, Colors.cyan.shade900]
              )
              ),
          )
        )
        );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}