import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

Future awesomeDialog(
    BuildContext context, String title, String desc, onPressed) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
            content: Text(desc,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify),
            actions: [
              TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      color: accentColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text(
                  'Confirm',
                  style: TextStyle(
                      color: buttonGreenColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: onPressed,
              ),
            ],
            elevation: 15.0,
          ));
}

Future awesomeDoubleButtonDialog(
    BuildContext context,
    String title,
    String desc,
    String leftButton,
    onPressedLeft,
    String rightButton,
    onPressedRight) {
  return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
            content: Text(desc,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify),
            actions: [
              TextButton(
                child: Text(
                  leftButton,
                  style: TextStyle(
                      color: accentColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: onPressedLeft,
              ),
              FlatButton(
                child: Text(
                  rightButton,
                  style: TextStyle(
                      color: buttonGreenColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: onPressedRight,
              ),
            ],
            elevation: 15.0,
          ));
}

Future awesomeSingleDialog(
    BuildContext context, String title, String desc, onPressed) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(
              title,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
            content: const Text('Wrong Email/Password. Try Again.',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
            actions: [
              TextButton(
                child:const Text(
                  'Got it!',
                  style: TextStyle(
                      color: buttonGreenColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: onPressed,
              ),
            ],
            elevation: 15.0,
          ));
}
