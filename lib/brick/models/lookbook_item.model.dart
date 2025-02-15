import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';
import 'package:openwardrobe/brick/models/lookbook.model.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'lookbook_items'),
  sqliteConfig: SqliteSerializable(),
)
class LookbookItem extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;
  
  @Supabase(foreignKey: 'lookbook_id')
  final Lookbook lookbook;
  
  final String itemId; // Assuming polymorphic, keep as scalar.
  final String itemType;
  final DateTime createdAt;

  LookbookItem({
    String? id,
    required this.lookbook,
    required this.itemId,
    required this.itemType,
    DateTime? createdAt,
  }) : id = id ?? const Uuid().v4(),
       createdAt = createdAt ?? DateTime.now();
}
