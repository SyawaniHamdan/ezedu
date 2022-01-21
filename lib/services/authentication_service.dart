import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/services/tutor_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';

class AuthenticationService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final TutorService _tutorService = locator<TutorService>();

  var _currentTutor;
  get currentTutor => _currentTutor;

  Future signInWithEmailAndPassword(
      {String email = "", String password = ""}) async {
    try {
      auth.UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      auth.User? user = userCredential.user;

      return user != null;
    } catch (e) {
      // return e.message;
      return "Fail to login!";
    }
  }

  Future registerWithEmailAndPassword({
    @required String name = "",
    @required String email = "",
    @required String password = "",
    @required String phone = "",
    @required String gender = "",
    @required String address = "",
    @required String type = "",
  }) async {
    try {
      auth.UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      auth.User? user = userCredential.user;

      if (type == "Tutor") {
        _currentTutor = Tutor(
          id: user?.uid,
          name: name,
          email: email,
          phone: phone,
          gender: gender,
          address: address,
        );

        await _tutorService.createTutor(_currentTutor);
      }

      return user != null;
    } catch (e) {
      // return e.message;
      return "Fail to register!";
    }
  }

  Future signOut() async {
    try {
      await _firebaseAuth.signOut();
      return null;
    } catch (e) {
      // return e.message;
      return "Fail to logout!";
    }
  }
}
