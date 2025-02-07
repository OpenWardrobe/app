import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  // Initialize Supabase
  await Supabase.initialize(
    url: "https://openwdsupdemo.sug.lol",
    anonKey: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzdXBhYmFzZSIsImlhdCI6MTczODg5ODA0MCwiZXhwIjo0ODk0NTcxNjQwLCJyb2xlIjoiYW5vbiJ9.bv0LuM7PP9JxKSrI7XTzw_I2IS7-86L8iqIkHiN-aQI",
    debug: true,
  );

  // Initialize Hive for local storage
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'OpenWardrobe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
