import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';
import 'package:openwardrobe/brick/models/wardrobe_item.model.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'item_metadata'),
  sqliteConfig: SqliteSerializable(),
)
class ItemMetadata extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;
  
  // Association: foreign key 'wardrobe_item_id'
  @Supabase(foreignKey: 'wardrobe_item_id')
  final WardrobeItem wardrobeItem;
  
  final double? boughtFor;
  final String currency;
  final DateTime? purchaseDate;
  final String? condition;
  final String? material;
  final String? size;
  final String? color;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  ItemMetadata({
    String? id,
    required this.wardrobeItem,
    this.boughtFor,
    String? currency,
    this.purchaseDate,
    this.condition,
    this.material,
    this.size,
    this.color,
    this.notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? const Uuid().v4(),
       currency = currency ?? 'USD',
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();
}
