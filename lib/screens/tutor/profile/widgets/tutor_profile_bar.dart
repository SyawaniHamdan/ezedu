import 'package:ezedu/screens/tutor/login/widgets/tutor_login_viewmodel.dart';
import 'package:ezedu/screens/tutor/menu/tutor_menu.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TutorProfileBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TutorLoginViewModel>.reactive(
        disposeViewModel: false,
        viewModelBuilder: () => TutorLoginViewModel(),
        // onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => AppBar(
            backgroundColor: const Color(0xFF006064),
            centerTitle: true,
            title: const Text('Profile Dashboard'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => tutorMainMenu(1),
                  ),
                );
              },
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    Colors.purple.shade700,
                    Colors.deepPurple.shade700
                  ])),
            )));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
