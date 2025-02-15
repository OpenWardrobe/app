// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<CommunityPostLike> _$CommunityPostLikeFromSupabase(
    Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return CommunityPostLike(
      id: data['id'] as String?,
      post: await CommunityPostAdapter().fromSupabase(data['post'],
          provider: provider, repository: repository),
      userProfile: data['user_profile'] == null
          ? null
          : await UserProfileAdapter().fromSupabase(data['user_profile'],
              provider: provider, repository: repository),
      createdAt: data['created_at'] == null
          ? null
          : DateTime.tryParse(data['created_at'] as String));
}

Future<Map<String, dynamic>> _$CommunityPostLikeToSupabase(
    CommunityPostLike instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'post': await CommunityPostAdapter()
        .toSupabase(instance.post, provider: provider, repository: repository),
    'user_profile': instance.userProfile != null
        ? await UserProfileAdapter().toSupabase(instance.userProfile!,
            provider: provider, repository: repository)
        : null,
    'created_at': instance.createdAt.toIso8601String()
  };
}

Future<CommunityPostLike> _$CommunityPostLikeFromSqlite(
    Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return CommunityPostLike(
      id: data['id'] as String,
      post: (await repository!.getAssociation<CommunityPost>(
        Query.where('primaryKey', data['post_CommunityPost_brick_id'] as int,
            limit1: true),
      ))!
          .first,
      userProfile: data['user_profile_UserProfile_brick_id'] == null
          ? null
          : (data['user_profile_UserProfile_brick_id'] > -1
              ? (await repository.getAssociation<UserProfile>(
                  Query.where('primaryKey',
                      data['user_profile_UserProfile_brick_id'] as int,
                      limit1: true),
                ))
                  ?.first
              : null),
      createdAt: DateTime.parse(data['created_at'] as String))
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$CommunityPostLikeToSqlite(
    CommunityPostLike instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'post_CommunityPost_brick_id': instance.post.primaryKey ??
        await provider.upsert<CommunityPost>(instance.post,
            repository: repository),
    'user_profile_UserProfile_brick_id': instance.userProfile != null
        ? instance.userProfile!.primaryKey ??
            await provider.upsert<UserProfile>(instance.userProfile!,
                repository: repository)
        : null,
    'created_at': instance.createdAt.toIso8601String()
  };
}

/// Construct a [CommunityPostLike]
class CommunityPostLikeAdapter
    extends OfflineFirstWithSupabaseAdapter<CommunityPostLike> {
  CommunityPostLikeAdapter();

  @override
  final supabaseTableName = 'community_post_likes';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'post': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'post',
      associationType: CommunityPost,
      associationIsNullable: false,
      foreignKey: 'post_id',
    ),
    'userProfile': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'user_profile',
      associationType: UserProfile,
      associationIsNullable: true,
      foreignKey: 'user_profile_id',
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
    'post': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'post_CommunityPost_brick_id',
      iterable: false,
      type: CommunityPost,
    ),
    'userProfile': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'user_profile_UserProfile_brick_id',
      iterable: false,
      type: UserProfile,
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
      CommunityPostLike instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `CommunityPostLike` WHERE id = ? LIMIT 1''',
        [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'CommunityPostLike';

  @override
  Future<CommunityPostLike> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$CommunityPostLikeFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(CommunityPostLike input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$CommunityPostLikeToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<CommunityPostLike> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$CommunityPostLikeFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(CommunityPostLike input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$CommunityPostLikeToSqlite(input,
          provider: provider, repository: repository);
}
