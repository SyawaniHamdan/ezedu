import 'package:ezedu/screens/tutor/login/widgets/tutor_login_viewmodel.dart';
import 'package:ezedu/screens/tutor/profile/widgets/tutor_profile_viewmodel.dart';
import 'package:ezedu/screens/tutor/register/widgets/tutor_register_viewmodel.dart';
import 'package:ezedu/services/authentication_service.dart';
import 'package:ezedu/services/tutor_profile.dart';
import 'package:ezedu/services/tutor_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void initializeLocator() {
  // Services
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => TutorService());
  locator.registerLazySingleton(() => TutorProfileService());

  // ViewModels
  locator.registerLazySingleton(() => TutorLoginViewModel());
  locator.registerLazySingleton(() => TutorRegisterViewModel());
  locator.registerLazySingleton(() => TutorProfileViewModel());
}
