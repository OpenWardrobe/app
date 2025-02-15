// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<OutfitItem> _$OutfitItemFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return OutfitItem(
      id: data['id'] as String?,
      outfit: await OutfitAdapter().fromSupabase(data['outfit'],
          provider: provider, repository: repository),
      wardrobeItem: await WardrobeItemAdapter().fromSupabase(
          data['wardrobe_item'],
          provider: provider,
          repository: repository));
}

Future<Map<String, dynamic>> _$OutfitItemToSupabase(OutfitItem instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'outfit': await OutfitAdapter().toSupabase(instance.outfit,
        provider: provider, repository: repository),
    'wardrobe_item': await WardrobeItemAdapter().toSupabase(
        instance.wardrobeItem,
        provider: provider,
        repository: repository)
  };
}

Future<OutfitItem> _$OutfitItemFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return OutfitItem(
      id: data['id'] as String,
      outfit: (await repository!.getAssociation<Outfit>(
        Query.where('primaryKey', data['outfit_Outfit_brick_id'] as int,
            limit1: true),
      ))!
          .first,
      wardrobeItem: (await repository.getAssociation<WardrobeItem>(
        Query.where(
            'primaryKey', data['wardrobe_item_WardrobeItem_brick_id'] as int,
            limit1: true),
      ))!
          .first)
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$OutfitItemToSqlite(OutfitItem instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'outfit_Outfit_brick_id': instance.outfit.primaryKey ??
        await provider.upsert<Outfit>(instance.outfit, repository: repository),
    'wardrobe_item_WardrobeItem_brick_id': instance.wardrobeItem.primaryKey ??
        await provider.upsert<WardrobeItem>(instance.wardrobeItem,
            repository: repository)
  };
}

/// Construct a [OutfitItem]
class OutfitItemAdapter extends OfflineFirstWithSupabaseAdapter<OutfitItem> {
  OutfitItemAdapter();

  @override
  final supabaseTableName = 'outfit_items';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'outfit': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'outfit',
      associationType: Outfit,
      associationIsNullable: false,
      foreignKey: 'outfit_id',
    ),
    'wardrobeItem': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'wardrobe_item',
      associationType: WardrobeItem,
      associationIsNullable: false,
      foreignKey: 'wardrobe_item_id',
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
    'outfit': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'outfit_Outfit_brick_id',
      iterable: false,
      type: Outfit,
    ),
    'wardrobeItem': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'wardrobe_item_WardrobeItem_brick_id',
      iterable: false,
      type: WardrobeItem,
    )
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
      OutfitItem instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `OutfitItem` WHERE id = ? LIMIT 1''', [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'OutfitItem';

  @override
  Future<OutfitItem> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$OutfitItemFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(OutfitItem input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$OutfitItemToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<OutfitItem> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$OutfitItemFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(OutfitItem input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$OutfitItemToSqlite(input,
          provider: provider, repository: repository);
}
