import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:openwardrobe/brick/models/outfit_item.model.dart';
import 'package:uuid/uuid.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'outfit'),
  sqliteConfig: SqliteSerializable(),
)
class Outfit extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;
  
  @Supabase(foreignKey: 'user_profile_id')
  final UserProfile? userProfile;
  
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  @Supabase(foreignKey: 'outfit_id')
  final List<OutfitItem> outfitItems;
  

  Outfit({
    String? id,
    required this.userProfile,
    required this.name,
    required this.outfitItems,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.deletedAt,
  }) : id = id ?? const Uuid().v4(),
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();
}
