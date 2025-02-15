import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';
import 'package:openwardrobe/brick/models/brand.model.dart';
import 'package:openwardrobe/brick/models/item_category.model.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'wardrobe_item'),
  sqliteConfig: SqliteSerializable(),
)
class WardrobeItem extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;
  
  @Supabase(foreignKey: 'user_profile_id')
  final UserProfile userProfile;
  
  @Supabase(foreignKey: 'brand_id')
  final Brand? brand;
  
  @Supabase(foreignKey: 'category_id')
  final ItemCategory? itemCategory;
  
  final DateTime createdAt;
  final DateTime updatedAt;
  
  @Sqlite(nullable: true)
  final DateTime? deletedAt;
  final String imagePath;

  WardrobeItem({
    String? id,
    required this.userProfile,
    this.brand,
    this.itemCategory,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.deletedAt,
    required this.imagePath,
  }) : id = id ?? const Uuid().v4(),
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();
}
