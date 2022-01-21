import 'package:ezedu/screens/student/payment/student_payment_body.dart';
import 'package:flutter/material.dart';

class StudentPaymentMainScreen extends StatelessWidget {
  const StudentPaymentMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StudentPaymentBody(),
    );
  }
}
