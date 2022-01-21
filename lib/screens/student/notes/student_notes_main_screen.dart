

import 'package:ezedu/screens/student/notes/student_notes_body.dart';
import 'package:flutter/material.dart';

class StudentNotesMainScreen extends StatelessWidget {
  const StudentNotesMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StudentNotesBody(),
    );
  }
}
