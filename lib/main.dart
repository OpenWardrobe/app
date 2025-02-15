import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:openwardrobe/repositories/app_repository.dart';
import 'router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// sqflite_common_ffi_web
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sqflite/sqflite.dart' show databaseFactory;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

   if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    }

    await AppRepository.configure(databaseFactory);

   


    await AppRepository().initialize();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'OpenWardrobe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 33, 243, 163)),
        useMaterial3: true,  // Enable Material 3 (modern UI)
      ),
      darkTheme: ThemeData.dark(),  // Support dark mode
      themeMode: ThemeMode.system,  // Automatically switch theme

      routerConfig: AppRouter.router,
    );
  }
}
