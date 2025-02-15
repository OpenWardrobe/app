// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<UseOutfit> _$UseOutfitFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return UseOutfit(
      id: data['id'] as String?,
      outfit: await OutfitAdapter().fromSupabase(data['outfit'],
          provider: provider, repository: repository),
      usedAt: data['used_at'] == null
          ? null
          : DateTime.tryParse(data['used_at'] as String),
      userProfile: data['user_profile'] == null
          ? null
          : await UserProfileAdapter().fromSupabase(data['user_profile'],
              provider: provider, repository: repository));
}

Future<Map<String, dynamic>> _$UseOutfitToSupabase(UseOutfit instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'outfit': await OutfitAdapter().toSupabase(instance.outfit,
        provider: provider, repository: repository),
    'used_at': instance.usedAt.toIso8601String(),
    'user_profile': instance.userProfile != null
        ? await UserProfileAdapter().toSupabase(instance.userProfile!,
            provider: provider, repository: repository)
        : null
  };
}

Future<UseOutfit> _$UseOutfitFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return UseOutfit(
      id: data['id'] as String,
      outfit: (await repository!.getAssociation<Outfit>(
        Query.where('primaryKey', data['outfit_Outfit_brick_id'] as int,
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

Future<Map<String, dynamic>> _$UseOutfitToSqlite(UseOutfit instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'outfit_Outfit_brick_id': instance.outfit.primaryKey ??
        await provider.upsert<Outfit>(instance.outfit, repository: repository),
    'used_at': instance.usedAt.toIso8601String(),
    'user_profile_UserProfile_brick_id': instance.userProfile != null
        ? instance.userProfile!.primaryKey ??
            await provider.upsert<UserProfile>(instance.userProfile!,
                repository: repository)
        : null
  };
}

/// Construct a [UseOutfit]
class UseOutfitAdapter extends OfflineFirstWithSupabaseAdapter<UseOutfit> {
  UseOutfitAdapter();

  @override
  final supabaseTableName = 'use_outfit';
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
    'outfit': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'outfit_Outfit_brick_id',
      iterable: false,
      type: Outfit,
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
      UseOutfit instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `UseOutfit` WHERE id = ? LIMIT 1''', [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'UseOutfit';

  @override
  Future<UseOutfit> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UseOutfitFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(UseOutfit input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UseOutfitToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<UseOutfit> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UseOutfitFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(UseOutfit input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UseOutfitToSqlite(input,
          provider: provider, repository: repository);
}
