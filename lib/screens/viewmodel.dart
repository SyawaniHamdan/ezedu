//JANGAN KACAU APE APE
import 'package:ezedu/models/student.dart';
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/services/authentication_service.dart';
import 'package:ezedu/services/students/student_authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:ezedu/app/locator.dart';

class ViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
   final StudentAuthenticationService _studentAuthenticationService =
       locator<StudentAuthenticationService>();

  Tutor get currentTutor => _authenticationService.currentTutor;
  Student get currentStudent => _studentAuthenticationService.currentStudent;

}
