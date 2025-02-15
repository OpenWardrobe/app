import 'package:get_it/get_it.dart';

import '../repositories/app_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Register the AppRepository instance.
  // Ensure that AppRepository.configure(...) is called before or within its constructor.
  getIt.registerSingleton<AppRepository>(AppRepository());
}

AppRepository get appRepository => getIt<AppRepository>();
