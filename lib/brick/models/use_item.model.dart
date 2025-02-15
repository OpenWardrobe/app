import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';
import 'package:openwardrobe/brick/models/wardrobe_item.model.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'use_item'),
  sqliteConfig: SqliteSerializable(),
)
class UseItem extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;
  
  @Supabase(foreignKey: 'wardrobe_item_id')
  final WardrobeItem wardrobeItem;
  
  final DateTime usedAt;
  
  @Supabase(foreignKey: 'user_profile_id')
  final UserProfile? userProfile;

  UseItem({
    String? id,
    required this.wardrobeItem,
    DateTime? usedAt,
    required this.userProfile,
  }) : id = id ?? const Uuid().v4(),
       usedAt = usedAt ?? DateTime.now();
}
