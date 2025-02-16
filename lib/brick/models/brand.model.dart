import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'brand'),
  sqliteConfig: SqliteSerializable(),
)
class Brand extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;
  final String name;

  // Association: foreign key 'user_id' references user_profiles.id
   @Supabase(foreignKey: 'user_profile_id')
  final UserProfile? userProfile;

  Brand({
    String? id,
    required this.name,
    this.userProfile,
  }) : id = id ?? const Uuid().v4();
}
