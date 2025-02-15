import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';
import 'package:openwardrobe/brick/models/outfit.model.dart';
import 'package:openwardrobe/brick/models/wardrobe_item.model.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'outfit_items'),
  sqliteConfig: SqliteSerializable(),
)
class OutfitItem extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;
  
  @Supabase(foreignKey: 'outfit_id')
  final Outfit outfit;
  
  @Supabase(foreignKey: 'wardrobe_item_id')
  final WardrobeItem wardrobeItem;

  OutfitItem({
    String? id,
    required this.outfit,
    required this.wardrobeItem,
  }) : id = id ?? const Uuid().v4();
}
