import 'package:ezedu/screens/guest/guest_menu_viewmodel.dart';
//import 'package:ezedu/screens/student/classes/student_classes_viewmodel.dart';
import 'package:ezedu/screens/student/login/students/student_login_viewmodel.dart';
import 'package:ezedu/screens/student/notes/student_notes_viewmodel.dart';
import 'package:ezedu/screens/student/payment/student_payment_viewmodel.dart';
import 'package:ezedu/screens/student/profile/student_profile_viewmodel.dart';
import 'package:ezedu/screens/student/register/students/student_register_viewmodel.dart';
import 'package:ezedu/screens/tutor/login/widgets/tutor_login_viewmodel.dart';
import 'package:ezedu/screens/tutor/menu/viewmodels/tutor_viewmodel_feed.dart';
import 'package:ezedu/screens/tutor/menu/viewmodels/tutor_subjectList_viewmodel.dart';
import 'package:ezedu/screens/tutor/menu/viewmodels/tutor_viewmodel_notes.dart';
import 'package:ezedu/screens/tutor/payment/tutor_payment_viewmodel.dart';
import 'package:ezedu/screens/tutor/profile/widgets/tutor_profile_viewmodel.dart';
import 'package:ezedu/screens/tutor/register/widgets/tutor_register_viewmodel.dart';
import 'package:ezedu/services/authentication_service.dart';
import 'package:ezedu/services/students/student_authentication_service.dart';
import 'package:ezedu/services/students/student_service.dart';
import 'package:ezedu/services/studentsubject_service.dart';
import 'package:ezedu/services/subject_service.dart';
import 'package:ezedu/services/tutor_note_service.dart';
import 'package:ezedu/services/tutor_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void initializeLocator() {
  // Services
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => StudentAuthenticationService());
  locator.registerLazySingleton(() => TutorService());
  locator.registerLazySingleton(() => StudentService());
  locator.registerLazySingleton(() => SubjectService());
  locator.registerLazySingleton(() => StudentSubjectService());
  locator.registerLazySingleton(() => NoteService());

  // ViewModels
  locator.registerLazySingleton(() => TutorLoginViewModel());
  locator.registerLazySingleton(() => TutorRegisterViewModel());
  locator.registerLazySingleton(() => TutorProfileViewModel());
  locator.registerLazySingleton(() => TutorFeedViewModel());
  locator.registerLazySingleton(() => TutorPaymentViewModel());
  locator.registerLazySingleton(() => TutorSubjectListViewModel());
  locator.registerLazySingleton(() => TutorNotesViewModel());

  locator.registerLazySingleton(() => StudentLoginViewModel());
  locator.registerLazySingleton(() => StudentRegisterViewModel());
  locator.registerLazySingleton(() => StudentProfileViewModel());
  locator.registerLazySingleton(() => StudentPaymentViewModel());
  // locator.registerLazySingleton(() => StudentClassesViewModel());
  locator.registerLazySingleton(() => StudentNotesViewModel());

  locator.registerLazySingleton(() => GuestMenuViewModel());
}
