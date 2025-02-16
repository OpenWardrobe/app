// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<LookbookItem> _$LookbookItemFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return LookbookItem(
      id: data['id'] as String?,
      lookbook: await LookbookAdapter().fromSupabase(data['lookbook'],
          provider: provider, repository: repository),
      itemId: data['item_id'] as String,
      itemType: data['item_type'] as String,
      createdAt: data['created_at'] == null
          ? null
          : DateTime.tryParse(data['created_at'] as String));
}

Future<Map<String, dynamic>> _$LookbookItemToSupabase(LookbookItem instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'lookbook': await LookbookAdapter().toSupabase(instance.lookbook,
        provider: provider, repository: repository),
    'item_id': instance.itemId,
    'item_type': instance.itemType,
    'created_at': instance.createdAt.toIso8601String()
  };
}

Future<LookbookItem> _$LookbookItemFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return LookbookItem(
      id: data['id'] as String,
      lookbook: (await repository!.getAssociation<Lookbook>(
        Query.where('primaryKey', data['lookbook_Lookbook_brick_id'] as int,
            limit1: true),
      ))!
          .first,
      itemId: data['item_id'] as String,
      itemType: data['item_type'] as String,
      createdAt: DateTime.parse(data['created_at'] as String))
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$LookbookItemToSqlite(LookbookItem instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'lookbook_Lookbook_brick_id': instance.lookbook.primaryKey ??
        await provider.upsert<Lookbook>(instance.lookbook,
            repository: repository),
    'item_id': instance.itemId,
    'item_type': instance.itemType,
    'created_at': instance.createdAt.toIso8601String()
  };
}

/// Construct a [LookbookItem]
class LookbookItemAdapter
    extends OfflineFirstWithSupabaseAdapter<LookbookItem> {
  LookbookItemAdapter();

  @override
  final supabaseTableName = 'lookbook_items';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'lookbook': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'lookbook',
      associationType: Lookbook,
      associationIsNullable: false,
      foreignKey: 'lookbook_id',
    ),
    'itemId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'item_id',
    ),
    'itemType': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'item_type',
    ),
    'createdAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'created_at',
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
    'lookbook': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'lookbook_Lookbook_brick_id',
      iterable: false,
      type: Lookbook,
    ),
    'itemId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'item_id',
      iterable: false,
      type: String,
    ),
    'itemType': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'item_type',
      iterable: false,
      type: String,
    ),
    'createdAt': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'created_at',
      iterable: false,
      type: DateTime,
    )
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
      LookbookItem instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `LookbookItem` WHERE id = ? LIMIT 1''', [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'LookbookItem';

  @override
  Future<LookbookItem> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$LookbookItemFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(LookbookItem input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$LookbookItemToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<LookbookItem> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$LookbookItemFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(LookbookItem input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$LookbookItemToSqlite(input,
          provider: provider, repository: repository);
}
