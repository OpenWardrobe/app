// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<ItemMetadata> _$ItemMetadataFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return ItemMetadata(
      id: data['id'] as String?,
      wardrobeItem: await WardrobeItemAdapter().fromSupabase(
          data['wardrobe_item'],
          provider: provider,
          repository: repository),
      boughtFor:
          data['bought_for'] == null ? null : data['bought_for'] as double?,
      currency: data['currency'] as String?,
      purchaseDate: data['purchase_date'] == null
          ? null
          : data['purchase_date'] == null
              ? null
              : DateTime.tryParse(data['purchase_date'] as String),
      condition:
          data['condition'] == null ? null : data['condition'] as String?,
      material: data['material'] == null ? null : data['material'] as String?,
      size: data['size'] == null ? null : data['size'] as String?,
      color: data['color'] == null ? null : data['color'] as String?,
      notes: data['notes'] == null ? null : data['notes'] as String?,
      createdAt: data['created_at'] == null
          ? null
          : DateTime.tryParse(data['created_at'] as String),
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.tryParse(data['updated_at'] as String));
}

Future<Map<String, dynamic>> _$ItemMetadataToSupabase(ItemMetadata instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'wardrobe_item': await WardrobeItemAdapter().toSupabase(
        instance.wardrobeItem,
        provider: provider,
        repository: repository),
    'bought_for': instance.boughtFor,
    'currency': instance.currency,
    'purchase_date': instance.purchaseDate?.toIso8601String(),
    'condition': instance.condition,
    'material': instance.material,
    'size': instance.size,
    'color': instance.color,
    'notes': instance.notes,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String()
  };
}

Future<ItemMetadata> _$ItemMetadataFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return ItemMetadata(
      id: data['id'] as String,
      wardrobeItem: (await repository!.getAssociation<WardrobeItem>(
        Query.where(
            'primaryKey', data['wardrobe_item_WardrobeItem_brick_id'] as int,
            limit1: true),
      ))!
          .first,
      boughtFor:
          data['bought_for'] == null ? null : data['bought_for'] as double?,
      currency: data['currency'] as String,
      purchaseDate: data['purchase_date'] == null
          ? null
          : data['purchase_date'] == null
              ? null
              : DateTime.tryParse(data['purchase_date'] as String),
      condition:
          data['condition'] == null ? null : data['condition'] as String?,
      material: data['material'] == null ? null : data['material'] as String?,
      size: data['size'] == null ? null : data['size'] as String?,
      color: data['color'] == null ? null : data['color'] as String?,
      notes: data['notes'] == null ? null : data['notes'] as String?,
      createdAt: DateTime.parse(data['created_at'] as String),
      updatedAt: DateTime.parse(data['updated_at'] as String))
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$ItemMetadataToSqlite(ItemMetadata instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'wardrobe_item_WardrobeItem_brick_id': instance.wardrobeItem.primaryKey ??
        await provider.upsert<WardrobeItem>(instance.wardrobeItem,
            repository: repository),
    'bought_for': instance.boughtFor,
    'currency': instance.currency,
    'purchase_date': instance.purchaseDate?.toIso8601String(),
    'condition': instance.condition,
    'material': instance.material,
    'size': instance.size,
    'color': instance.color,
    'notes': instance.notes,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String()
  };
}

/// Construct a [ItemMetadata]
class ItemMetadataAdapter
    extends OfflineFirstWithSupabaseAdapter<ItemMetadata> {
  ItemMetadataAdapter();

  @override
  final supabaseTableName = 'item_metadata';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'wardrobeItem': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'wardrobe_item',
      associationType: WardrobeItem,
      associationIsNullable: false,
      foreignKey: 'wardrobe_item_id',
    ),
    'boughtFor': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'bought_for',
    ),
    'currency': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'currency',
    ),
    'purchaseDate': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'purchase_date',
    ),
    'condition': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'condition',
    ),
    'material': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'material',
    ),
    'size': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'size',
    ),
    'color': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'color',
    ),
    'notes': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'notes',
    ),
    'createdAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'created_at',
    ),
    'updatedAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'updated_at',
    )
  };
  @override
  final ignoreDuplicates = false;
  @override
  final uniqueFields = {'id'};
  @override
  final Map<String, RuntimeSqliteColumnDefinition> fieldsToSqliteColumns = {
    'primaryKey': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: '_brick_id',
      iterable: false,
      type: int,
    ),
    'id': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'id',
      iterable: false,
      type: String,
    ),
    'wardrobeItem': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'wardrobe_item_WardrobeItem_brick_id',
      iterable: false,
      type: WardrobeItem,
    ),
    'boughtFor': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'bought_for',
      iterable: false,
      type: double,
    ),
    'currency': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'currency',
      iterable: false,
      type: String,
    ),
    'purchaseDate': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'purchase_date',
      iterable: false,
      type: DateTime,
    ),
    'condition': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'condition',
      iterable: false,
      type: String,
    ),
    'material': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'material',
      iterable: false,
      type: String,
    ),
    'size': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'size',
      iterable: false,
      type: String,
    ),
    'color': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'color',
      iterable: false,
      type: String,
    ),
    'notes': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'notes',
      iterable: false,
      type: String,
    ),
    'createdAt': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'created_at',
      iterable: false,
      type: DateTime,
    ),
    'updatedAt': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'updated_at',
      iterable: false,
      type: DateTime,
    )
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
      ItemMetadata instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `ItemMetadata` WHERE id = ? LIMIT 1''', [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'ItemMetadata';

  @override
  Future<ItemMetadata> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$ItemMetadataFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(ItemMetadata input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$ItemMetadataToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<ItemMetadata> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$ItemMetadataFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(ItemMetadata input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$ItemMetadataToSqlite(input,
          provider: provider, repository: repository);
}
