// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<UseItem> _$UseItemFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return UseItem(
      id: data['id'] as String?,
      wardrobeItem: await WardrobeItemAdapter().fromSupabase(
          data['wardrobe_item'],
          provider: provider,
          repository: repository),
      usedAt: data['used_at'] == null
          ? null
          : DateTime.tryParse(data['used_at'] as String),
      userProfile: data['user_profile'] == null
          ? null
          : await UserProfileAdapter().fromSupabase(data['user_profile'],
              provider: provider, repository: repository));
}

Future<Map<String, dynamic>> _$UseItemToSupabase(UseItem instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'wardrobe_item': await WardrobeItemAdapter().toSupabase(
        instance.wardrobeItem,
        provider: provider,
        repository: repository),
    'used_at': instance.usedAt.toIso8601String(),
    'user_profile': instance.userProfile != null
        ? await UserProfileAdapter().toSupabase(instance.userProfile!,
            provider: provider, repository: repository)
        : null
  };
}

Future<UseItem> _$UseItemFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return UseItem(
      id: data['id'] as String,
      wardrobeItem: (await repository!.getAssociation<WardrobeItem>(
        Query.where(
            'primaryKey', data['wardrobe_item_WardrobeItem_brick_id'] as int,
            limit1: true),
      ))!
          .first,
      usedAt: DateTime.parse(data['used_at'] as String),
      userProfile: data['user_profile_UserProfile_brick_id'] == null
          ? null
          : (data['user_profile_UserProfile_brick_id'] > -1
              ? (await repository.getAssociation<UserProfile>(
                  Query.where('primaryKey',
                      data['user_profile_UserProfile_brick_id'] as int,
                      limit1: true),
                ))
                  ?.first
              : null))
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$UseItemToSqlite(UseItem instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'wardrobe_item_WardrobeItem_brick_id': instance.wardrobeItem.primaryKey ??
        await provider.upsert<WardrobeItem>(instance.wardrobeItem,
            repository: repository),
    'used_at': instance.usedAt.toIso8601String(),
    'user_profile_UserProfile_brick_id': instance.userProfile != null
        ? instance.userProfile!.primaryKey ??
            await provider.upsert<UserProfile>(instance.userProfile!,
                repository: repository)
        : null
  };
}

/// Construct a [UseItem]
class UseItemAdapter extends OfflineFirstWithSupabaseAdapter<UseItem> {
  UseItemAdapter();

  @override
  final supabaseTableName = 'use_item';
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
    'usedAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'used_at',
    ),
    'userProfile': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'user_profile',
      associationType: UserProfile,
      associationIsNullable: true,
      foreignKey: 'user_profile_id',
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
    'usedAt': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'used_at',
      iterable: false,
      type: DateTime,
    ),
    'userProfile': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'user_profile_UserProfile_brick_id',
      iterable: false,
      type: UserProfile,
    )
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
      UseItem instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `UseItem` WHERE id = ? LIMIT 1''', [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'UseItem';

  @override
  Future<UseItem> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UseItemFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(UseItem input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UseItemToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<UseItem> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UseItemFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(UseItem input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UseItemToSqlite(input,
          provider: provider, repository: repository);
}
