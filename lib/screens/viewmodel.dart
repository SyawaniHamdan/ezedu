//JANGAN KACAU APE APE
import 'package:ezedu/models/tutor.dart';
import 'package:ezedu/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:ezedu/app/locator.dart';

class ViewModel extends BaseViewModel {

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Tutor get currentTutor => _authenticationService.currentTutor;
  
}
