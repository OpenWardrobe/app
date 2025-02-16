// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<ItemCategory> _$ItemCategoryFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return ItemCategory(id: data['id'] as String?, name: data['name'] as String);
}

Future<Map<String, dynamic>> _$ItemCategoryToSupabase(ItemCategory instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {'id': instance.id, 'name': instance.name};
}

Future<ItemCategory> _$ItemCategoryFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return ItemCategory(id: data['id'] as String, name: data['name'] as String)
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$ItemCategoryToSqlite(ItemCategory instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {'id': instance.id, 'name': instance.name};
}

/// Construct a [ItemCategory]
class ItemCategoryAdapter
    extends OfflineFirstWithSupabaseAdapter<ItemCategory> {
  ItemCategoryAdapter();

  @override
  final supabaseTableName = 'item_category';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'name': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'name',
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
    'name': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'name',
      iterable: false,
      type: String,
    )
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
      ItemCategory instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `ItemCategory` WHERE id = ? LIMIT 1''', [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'ItemCategory';

  @override
  Future<ItemCategory> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$ItemCategoryFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(ItemCategory input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$ItemCategoryToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<ItemCategory> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$ItemCategoryFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(ItemCategory input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$ItemCategoryToSqlite(input,
          provider: provider, repository: repository);
}
