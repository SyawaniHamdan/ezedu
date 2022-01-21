import 'package:ezedu/screens/student/chat/student_chat_body.dart';
import 'package:flutter/material.dart';

class StudentChatMainScreen extends StatelessWidget{
  const StudentChatMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StudentChatBody(),
    );
  }
}