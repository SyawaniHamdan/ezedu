import 'dart:io';
import 'package:ezedu/app/locator.dart';
import 'package:ezedu/screens/viewmodel.dart';
import 'package:ezedu/services/authentication_service.dart';
import 'package:ezedu/services/tutor_class.dart';

class TutorFeedViewModel extends ViewModel {
  final AuthenticationService _authenticationService =
    locator<AuthenticationService>();

  final TutorClassService _tutorClassService = locator<TutorClassService>();
  
}
