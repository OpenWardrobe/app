// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<UserProfile> _$UserProfileFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return UserProfile(
      id: data['id'] as String,
      username: data['username'] as String,
      displayName:
          data['display_name'] == null ? null : data['display_name'] as String?,
      bio: data['bio'] == null ? null : data['bio'] as String?,
      avatarUrl:
          data['avatar_url'] == null ? null : data['avatar_url'] as String?,
      socialLinks: data['social_links'] == null ? null : data['social_links'],
      isPublic: data['is_public'] as bool?,
      createdAt: data['created_at'] == null
          ? null
          : DateTime.tryParse(data['created_at'] as String),
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.tryParse(data['updated_at'] as String));
}

Future<Map<String, dynamic>> _$UserProfileToSupabase(UserProfile instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'username': instance.username,
    'display_name': instance.displayName,
    'bio': instance.bio,
    'avatar_url': instance.avatarUrl,
    'social_links': instance.socialLinks,
    'is_public': instance.isPublic,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String()
  };
}

Future<UserProfile> _$UserProfileFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return UserProfile(
      id: data['id'] as String,
      username: data['username'] as String,
      displayName:
          data['display_name'] == null ? null : data['display_name'] as String?,
      bio: data['bio'] == null ? null : data['bio'] as String?,
      avatarUrl:
          data['avatar_url'] == null ? null : data['avatar_url'] as String?,
      socialLinks: data['social_links'] == null
          ? null
          : jsonDecode(data['social_links']),
      isPublic: data['is_public'] == 1,
      createdAt: DateTime.parse(data['created_at'] as String),
      updatedAt: DateTime.parse(data['updated_at'] as String))
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$UserProfileToSqlite(UserProfile instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'username': instance.username,
    'display_name': instance.displayName,
    'bio': instance.bio,
    'avatar_url': instance.avatarUrl,
    'social_links':
        instance.socialLinks != null ? jsonEncode(instance.socialLinks) : null,
    'is_public': instance.isPublic ? 1 : 0,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String()
  };
}

/// Construct a [UserProfile]
class UserProfileAdapter extends OfflineFirstWithSupabaseAdapter<UserProfile> {
  UserProfileAdapter();

  @override
  final supabaseTableName = 'user_profiles';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'username': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'username',
    ),
    'displayName': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'display_name',
    ),
    'bio': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'bio',
    ),
    'avatarUrl': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'avatar_url',
    ),
    'socialLinks': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'social_links',
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
    'username': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'username',
      iterable: false,
      type: String,
    ),
    'displayName': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'display_name',
      iterable: false,
      type: String,
    ),
    'bio': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'bio',
      iterable: false,
      type: String,
    ),
    'avatarUrl': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'avatar_url',
      iterable: false,
      type: String,
    ),
    'socialLinks': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'social_links',
      iterable: false,
      type: Map,
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
      UserProfile instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `UserProfile` WHERE id = ? LIMIT 1''', [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'UserProfile';

  @override
  Future<UserProfile> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UserProfileFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(UserProfile input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UserProfileToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<UserProfile> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UserProfileFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(UserProfile input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$UserProfileToSqlite(input,
          provider: provider, repository: repository);
}
