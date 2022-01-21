import 'package:ezedu/screens/tutor/login/widgets/tutor_login_viewmodel.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void initializeLocator() {
  locator.registerLazySingleton(() => TutorLoginViewModel());
}
