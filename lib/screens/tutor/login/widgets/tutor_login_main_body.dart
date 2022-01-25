import 'package:flutter/material.dart';

class TutorLoginMainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Text(
              "LOGIN",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF006064),
                  fontSize: 36),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: const TextField(
              decoration: InputDecoration(labelText: "Email"),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: const TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: const Text(
              "Forgot your password?",
              style: TextStyle(fontSize: 12, color: Color(0XFFE53935)),
            ),
          ),
         const SizedBox(height: 16),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                // call funtion login kat viewmodel

                Navigator.pushNamed(context, '/tutor_home');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan[800], //change background color of button
                onPrimary: Colors.white, //change text color of button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 15.0,
              ),
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                width: 150,
                padding: const EdgeInsets.all(0),
                child: const Text(
                  "LOGIN",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: GestureDetector(
              onTap: () {},
              child:const Text(
                "Don't Have an Account? Sign up",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB71C1C)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
