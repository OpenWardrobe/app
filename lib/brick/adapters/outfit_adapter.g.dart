// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<Outfit> _$OutfitFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return Outfit(
      id: data['id'] as String?,
      userProfile: data['user_profile'] == null
          ? null
          : await UserProfileAdapter().fromSupabase(data['user_profile'],
              provider: provider, repository: repository),
      name: data['name'] as String,
      createdAt: data['created_at'] == null
          ? null
          : DateTime.tryParse(data['created_at'] as String),
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.tryParse(data['updated_at'] as String),
      deletedAt: data['deleted_at'] == null
          ? null
          : data['deleted_at'] == null
              ? null
              : DateTime.tryParse(data['deleted_at'] as String),
      outfitItems: await Future.wait<OutfitItem>(data['outfit_items']
              ?.map((d) => OutfitItemAdapter()
                  .fromSupabase(d, provider: provider, repository: repository))
              .toList()
              .cast<Future<OutfitItem>>() ??
          []));
}

Future<Map<String, dynamic>> _$OutfitToSupabase(Outfit instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'user_profile': instance.userProfile != null
        ? await UserProfileAdapter().toSupabase(instance.userProfile!,
            provider: provider, repository: repository)
        : null,
    'name': instance.name,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String(),
    'deleted_at': instance.deletedAt?.toIso8601String(),
    'outfit_items': await Future.wait<Map<String, dynamic>>(instance.outfitItems
        .map((s) => OutfitItemAdapter()
            .toSupabase(s, provider: provider, repository: repository))
        .toList())
  };
}

Future<Outfit> _$OutfitFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return Outfit(
      id: data['id'] as String,
      userProfile: data['user_profile_UserProfile_brick_id'] == null
          ? null
          : (data['user_profile_UserProfile_brick_id'] > -1
              ? (await repository?.getAssociation<UserProfile>(
                  Query.where('primaryKey',
                      data['user_profile_UserProfile_brick_id'] as int,
                      limit1: true),
                ))
                  ?.first
              : null),
      name: data['name'] as String,
      createdAt: DateTime.parse(data['created_at'] as String),
      updatedAt: DateTime.parse(data['updated_at'] as String),
      deletedAt: data['deleted_at'] == null
          ? null
          : data['deleted_at'] == null
              ? null
              : DateTime.tryParse(data['deleted_at'] as String),
      outfitItems: (await provider.rawQuery(
              'SELECT DISTINCT `f_OutfitItem_brick_id` FROM `_brick_Outfit_outfit_items` WHERE l_Outfit_brick_id = ?',
              [data['_brick_id'] as int]).then((results) {
        final ids = results.map((r) => r['f_OutfitItem_brick_id']);
        return Future.wait<OutfitItem>(ids.map((primaryKey) => repository!
            .getAssociation<OutfitItem>(
              Query.where('primaryKey', primaryKey, limit1: true),
            )
            .then((r) => r!.first)));
      }))
          .toList()
          .cast<OutfitItem>())
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$OutfitToSqlite(Outfit instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'user_profile_UserProfile_brick_id': instance.userProfile != null
        ? instance.userProfile!.primaryKey ??
            await provider.upsert<UserProfile>(instance.userProfile!,
                repository: repository)
        : null,
    'name': instance.name,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String(),
    'deleted_at': instance.deletedAt?.toIso8601String()
  };
}

/// Construct a [Outfit]
class OutfitAdapter extends OfflineFirstWithSupabaseAdapter<Outfit> {
  OutfitAdapter();

  @override
  final supabaseTableName = 'outfit';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'userProfile': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'user_profile',
      associationType: UserProfile,
      associationIsNullable: true,
      foreignKey: 'user_profile_id',
    ),
    'name': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'name',
    ),
    'createdAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'created_at',
    ),
    'updatedAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'updated_at',
    ),
    'deletedAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'deleted_at',
    ),
    'outfitItems': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'outfit_items',
      associationType: OutfitItem,
      associationIsNullable: false,
      foreignKey: 'outfit_id',
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
    'userProfile': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'user_profile_UserProfile_brick_id',
      iterable: false,
      type: UserProfile,
    ),
    'name': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'name',
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
    ),
    'deletedAt': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'deleted_at',
      iterable: false,
      type: DateTime,
    ),
    'outfitItems': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'outfit_items',
      iterable: true,
      type: OutfitItem,
    )
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
      Outfit instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `Outfit` WHERE id = ? LIMIT 1''', [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'Outfit';
  @override
  Future<void> afterSave(instance, {required provider, repository}) async {
    if (instance.primaryKey != null) {
      final outfitItemsOldColumns = await provider.rawQuery(
          'SELECT `f_OutfitItem_brick_id` FROM `_brick_Outfit_outfit_items` WHERE `l_Outfit_brick_id` = ?',
          [instance.primaryKey]);
      final outfitItemsOldIds =
          outfitItemsOldColumns.map((a) => a['f_OutfitItem_brick_id']);
      final outfitItemsNewIds =
          instance.outfitItems.map((s) => s.primaryKey).whereType<int>();
      final outfitItemsIdsToDelete =
          outfitItemsOldIds.where((id) => !outfitItemsNewIds.contains(id));

      await Future.wait<void>(outfitItemsIdsToDelete.map((id) async {
        return await provider.rawExecute(
            'DELETE FROM `_brick_Outfit_outfit_items` WHERE `l_Outfit_brick_id` = ? AND `f_OutfitItem_brick_id` = ?',
            [instance.primaryKey, id]).catchError((e) => null);
      }));

      await Future.wait<int?>(instance.outfitItems.map((s) async {
        final id = s.primaryKey ??
            await provider.upsert<OutfitItem>(s, repository: repository);
        return await provider.rawInsert(
            'INSERT OR IGNORE INTO `_brick_Outfit_outfit_items` (`l_Outfit_brick_id`, `f_OutfitItem_brick_id`) VALUES (?, ?)',
            [instance.primaryKey, id]);
      }));
    }
  }

  @override
  Future<Outfit> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$OutfitFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(Outfit input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$OutfitToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Outfit> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$OutfitFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(Outfit input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$OutfitToSqlite(input, provider: provider, repository: repository);
}
