import 'package:ezedu/app/locator.dart';
import 'package:ezedu/models/student.dart';
import 'package:ezedu/services/students/student_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class StudentAuthenticationService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final StudentService _studentService = locator<StudentService>();

  var _currentStudent;
  get currentStudent => _currentStudent;

  Future signInWithEmailAndPassword(
      {String email = "", String password = ""}) async {
    try {
      auth.UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      auth.User? user = userCredential.user;
      await _populateCurrentStudent(user);

      return user != null;
    } catch (e) {
      // return e.message;
      return "Fail to login!";
    }
  }

  Future registerWithEmailAndPassword({
    String name = "",
    String email = "",
    String password = "",
    String phone = "",
    String gender = "",
    String address = "",
    String level = "",
    String type = "",
  }) async {
    try {
      auth.UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      auth.User? user = userCredential.user;

      if (type == "Student") {
        _currentStudent = Student(
          id: user?.uid,
          name: name,
          email: email,
          phone: phone,
          gender: gender,
          address: address,
        );

        await _studentService.createStudent(_currentStudent);
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

  Future<void> _populateCurrentStudent(auth.User? user) async {
    if (user != null) {
      _currentStudent = await _studentService.getStudent(id: user.uid);
    } else
      _currentStudent = null;
  }
}