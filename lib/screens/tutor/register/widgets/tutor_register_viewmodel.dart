
import 'package:flutter/material.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/services/authentication_service.dart';

class TutorRegisterViewModel extends ViewModel {

   final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
      
  Future signUp({
     String name = "",
     String email = "",
     String password = "",
     String phone = "",
     String gender = "",
     String address = "",
     String type = "",
     context,
  }) async {
    setBusy(true);

    var result = await _authenticationService.registerWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
      phone: phone,
      gender:gender,
      address:address,
      type: type,
    );

    setBusy(false);

    if (result is String) {
      //awesomeSingleDialog(context, 'Sign-Up Error', result, () => Navigator.of(context, rootNavigator: true).pop());
    } 
    else {
      if (result != null) {
          await Future.delayed(Duration(seconds: 1));
          await Navigator.of(context).pushReplacement(
              //MaterialPageRoute(builder: (context) => HostMainScreen(tab: 0)));
              MaterialPageRoute(builder: (context)));
        } /*else {
          await Future.delayed(Duration(seconds: 1));
          await Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => GuestMainScreen(tab: 0)));
        }
      } */
      else {
        //awesomeSingleDialog(
          //  context,
            //'Sign-Up Error',
            //'General sign-up failure. Please try again later',
            //() => Navigator.of(context, rootNavigator: true).pop());
      }
    }
  }
}
