// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20250214203603_up = [
  InsertTable('_brick_Outfit_outfit_items'),
  InsertForeignKey('_brick_Outfit_outfit_items', 'Outfit', foreignKeyColumn: 'l_Outfit_brick_id', onDeleteCascade: true, onDeleteSetDefault: false),
  InsertForeignKey('_brick_Outfit_outfit_items', 'OutfitItem', foreignKeyColumn: 'f_OutfitItem_brick_id', onDeleteCascade: true, onDeleteSetDefault: false),
  CreateIndex(columns: ['l_Outfit_brick_id', 'f_OutfitItem_brick_id'], onTable: '_brick_Outfit_outfit_items', unique: true)
];

const List<MigrationCommand> _migration_20250214203603_down = [
  DropTable('_brick_Outfit_outfit_items'),
  DropColumn('l_Outfit_brick_id', onTable: '_brick_Outfit_outfit_items'),
  DropColumn('f_OutfitItem_brick_id', onTable: '_brick_Outfit_outfit_items'),
  DropIndex('index__brick_Outfit_outfit_items_on_l_Outfit_brick_id_f_OutfitItem_brick_id')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20250214203603',
  up: _migration_20250214203603_up,
  down: _migration_20250214203603_down,
)
class Migration20250214203603 extends Migration {
  const Migration20250214203603()
    : super(
        version: 20250214203603,
        up: _migration_20250214203603_up,
        down: _migration_20250214203603_down,
      );
}
