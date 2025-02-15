import 'package:get_it/get_it.dart';

import '../repositories/app_repository.dart';
import '../controllers/camera_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/wardrobe_controller.dart';
import '../controllers/lookbook_controller.dart';



final getIt = GetIt.instance;

void setupLocator() {
  // Register the AppRepository instance.
  getIt.registerLazySingleton<AppRepository>(() => AppRepository());

  // Register controllers
  getIt.registerLazySingleton<CameraController>(() => CameraController());
  getIt.registerLazySingleton<HomeController>(() => HomeController());
  getIt.registerLazySingleton<WardrobeController>(() => WardrobeController());
  getIt.registerLazySingleton<LookbookController>(() => LookbookController());

}