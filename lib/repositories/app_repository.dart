import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_sqlite/memory_cache_provider.dart';
import 'package:brick_supabase/brick_supabase.dart' hide Supabase;
import 'package:openwardrobe/brick/db/schema.g.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:openwardrobe/brick/brick.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRepositoryProvider = Provider<AppRepository>((ref) {
  throw UnimplementedError();
});

class AppRepository extends OfflineFirstWithSupabaseRepository {
  static late AppRepository? _instance;

  AppRepository._({
    required super.supabaseProvider,
    required super.sqliteProvider,
    required super.migrations,
    required super.offlineRequestQueue,
    required super.memoryCacheProvider,
  });

  factory AppRepository() => _instance!;

  static Future<void> configure(DatabaseFactory databaseFactory) async {
    final (client, queue) = OfflineFirstWithSupabaseRepository.clientQueue(
      databaseFactory: databaseFactory,
    );

    await Supabase.initialize(
      url: "https://openwdsupdemo.sug.lol",
      anonKey: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJzdXBhYmFzZSIsImlhdCI6MTczODg5ODA0MCwiZXhwIjo0ODk0NTcxNjQwLCJyb2xlIjoiYW5vbiJ9.bv0LuM7PP9JxKSrI7XTzw_I2IS7-86L8iqIkHiN-aQI",
      debug: true,
    );

    final provider = SupabaseProvider(
      Supabase.instance.client,
      modelDictionary: supabaseModelDictionary,
    );

    _instance = AppRepository._(
      supabaseProvider: provider,
      sqliteProvider: SqliteProvider(
        'openwd.sqlite',
        databaseFactory: databaseFactory,
        modelDictionary: sqliteModelDictionary,
      ),
      migrations: migrations,
      offlineRequestQueue: queue,
      memoryCacheProvider: MemoryCacheProvider(),
    );
  }
}
