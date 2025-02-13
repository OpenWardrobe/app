import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'router/app_router.dart';

import 'models/wardrobe_item.dart';
import 'models/outfit.dart';
import 'models/brand.dart';
import 'models/item_category.dart';
import 'models/user_profile.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for local storage
  await Hive.initFlutter();

  // Initialize Supabase
  await Supabase.initialize(
    url: "https://openwdsupdemo.sug.lol",
    anonKey: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzdXBhYmFzZSIsImlhdCI6MTczODg5ODA0MCwiZXhwIjo0ODk0NTcxNjQwLCJyb2xlIjoiYW5vbiJ9.bv0LuM7PP9JxKSrI7XTzw_I2IS7-86L8iqIkHiN-aQI",
    debug: true,
  );


   Hive.registerAdapter(WardrobeItemAdapter());
  Hive.registerAdapter(OutfitAdapter());
  Hive.registerAdapter(BrandAdapter());
  Hive.registerAdapter(ItemCategoryAdapter());
  Hive.registerAdapter(UserProfileAdapter());

  runApp(const MyApp());
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
