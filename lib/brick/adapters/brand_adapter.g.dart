// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<Brand> _$BrandFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return Brand(
      id: data['id'] as String?,
      name: data['name'] as String,
      userProfile: data['user_profile'] == null
          ? null
          : await UserProfileAdapter().fromSupabase(data['user_profile'],
              provider: provider, repository: repository));
}

Future<Map<String, dynamic>> _$BrandToSupabase(Brand instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'name': instance.name,
    'user_profile': instance.userProfile != null
        ? await UserProfileAdapter().toSupabase(instance.userProfile!,
            provider: provider, repository: repository)
        : null
  };
}

Future<Brand> _$BrandFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return Brand(
      id: data['id'] as String,
      name: data['name'] as String,
      userProfile: data['user_profile_UserProfile_brick_id'] == null
          ? null
          : (data['user_profile_UserProfile_brick_id'] > -1
              ? (await repository?.getAssociation<UserProfile>(
                  Query.where('primaryKey',
                      data['user_profile_UserProfile_brick_id'] as int,
                      limit1: true),
                ))
                  ?.first
              : null))
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$BrandToSqlite(Brand instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'name': instance.name,
    'user_profile_UserProfile_brick_id': instance.userProfile != null
        ? instance.userProfile!.primaryKey ??
            await provider.upsert<UserProfile>(instance.userProfile!,
                repository: repository)
        : null
  };
}

/// Construct a [Brand]
class BrandAdapter extends OfflineFirstWithSupabaseAdapter<Brand> {
  BrandAdapter();

  @override
  final supabaseTableName = 'brand';
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
    'name': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'name',
      iterable: false,
      type: String,
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
      Brand instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `Brand` WHERE id = ? LIMIT 1''', [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'Brand';

  @override
  Future<Brand> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$BrandFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(Brand input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$BrandToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Brand> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$BrandFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(Brand input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$BrandToSqlite(input, provider: provider, repository: repository);
}
