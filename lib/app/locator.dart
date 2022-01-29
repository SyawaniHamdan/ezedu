
import 'package:ezedu/screens/student/login/students/student_login_viewmodel.dart';
import 'package:ezedu/screens/student/register/students/student_register_viewmodel.dart';
import 'package:ezedu/screens/tutor/login/widgets/tutor_login_viewmodel.dart';
import 'package:ezedu/screens/tutor/profile/widgets/tutor_profile_viewmodel.dart';
import 'package:ezedu/screens/tutor/register/widgets/tutor_register_viewmodel.dart';
import 'package:ezedu/services/authentication_service.dart';
import 'package:ezedu/services/students/student_authentication_service.dart';
import 'package:ezedu/services/students/student_service.dart';
import 'package:ezedu/services/tutor_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void initializeLocator() {
  // Services
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => StudentAuthenticationService());
  locator.registerLazySingleton(() => TutorService());
  locator.registerLazySingleton(() => StudentService());

  // ViewModels
  locator.registerLazySingleton(() => TutorLoginViewModel());
  locator.registerLazySingleton(() => TutorRegisterViewModel());
  locator.registerLazySingleton(() => TutorProfileViewModel());

  locator.registerLazySingleton(() => StudentLoginViewModel());
  locator.registerLazySingleton(() => StudentRegisterViewModel());

}
