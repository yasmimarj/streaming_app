import 'package:get_it/get_it.dart';
import 'core/services/navigation_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => NavigationService());
}
