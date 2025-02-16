// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<Lookbook> _$LookbookFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return Lookbook(
      id: data['id'] as String?,
      userProfile: data['user_profile'] == null
          ? null
          : await UserProfileAdapter().fromSupabase(data['user_profile'],
              provider: provider, repository: repository),
      title: data['title'] as String,
      description:
          data['description'] == null ? null : data['description'] as String?,
      coverImageUrl: data['cover_image_url'] == null
          ? null
          : data['cover_image_url'] as String?,
      tags: data['tags'] == null ? null : data['tags']?.toList().cast<String>(),
      isPublic: data['is_public'] as bool?,
      createdAt: data['created_at'] == null
          ? null
          : DateTime.tryParse(data['created_at'] as String),
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.tryParse(data['updated_at'] as String));
}

Future<Map<String, dynamic>> _$LookbookToSupabase(Lookbook instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'user_profile': instance.userProfile != null
        ? await UserProfileAdapter().toSupabase(instance.userProfile!,
            provider: provider, repository: repository)
        : null,
    'title': instance.title,
    'description': instance.description,
    'cover_image_url': instance.coverImageUrl,
    'tags': instance.tags,
    'is_public': instance.isPublic,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String()
  };
}

Future<Lookbook> _$LookbookFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return Lookbook(
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
      title: data['title'] as String,
      description:
          data['description'] == null ? null : data['description'] as String?,
      coverImageUrl: data['cover_image_url'] == null
          ? null
          : data['cover_image_url'] as String?,
      tags: data['tags'] == null
          ? null
          : jsonDecode(data['tags']).toList().cast<String>(),
      isPublic: data['is_public'] == 1,
      createdAt: DateTime.parse(data['created_at'] as String),
      updatedAt: DateTime.parse(data['updated_at'] as String))
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$LookbookToSqlite(Lookbook instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'user_profile_UserProfile_brick_id': instance.userProfile != null
        ? instance.userProfile!.primaryKey ??
            await provider.upsert<UserProfile>(instance.userProfile!,
                repository: repository)
        : null,
    'title': instance.title,
    'description': instance.description,
    'cover_image_url': instance.coverImageUrl,
    'tags': instance.tags == null ? null : jsonEncode(instance.tags),
    'is_public': instance.isPublic ? 1 : 0,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String()
  };
}

/// Construct a [Lookbook]
class LookbookAdapter extends OfflineFirstWithSupabaseAdapter<Lookbook> {
  LookbookAdapter();

  @override
  final supabaseTableName = 'lookbooks';
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
    'title': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'title',
    ),
    'description': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'description',
    ),
    'coverImageUrl': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'cover_image_url',
    ),
    'tags': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'tags',
    ),
    'isPublic': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'is_public',
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
    'userProfile': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'user_profile_UserProfile_brick_id',
      iterable: false,
      type: UserProfile,
    ),
    'title': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'title',
      iterable: false,
      type: String,
    ),
    'description': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'description',
      iterable: false,
      type: String,
    ),
    'coverImageUrl': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'cover_image_url',
      iterable: false,
      type: String,
    ),
    'tags': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'tags',
      iterable: true,
      type: String,
    ),
    'isPublic': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'is_public',
      iterable: false,
      type: bool,
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
      Lookbook instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `Lookbook` WHERE id = ? LIMIT 1''', [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'Lookbook';

  @override
  Future<Lookbook> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$LookbookFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(Lookbook input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$LookbookToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Lookbook> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$LookbookFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(Lookbook input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$LookbookToSqlite(input,
          provider: provider, repository: repository);
}
