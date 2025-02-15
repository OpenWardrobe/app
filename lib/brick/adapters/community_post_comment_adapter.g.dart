// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<CommunityPostComment> _$CommunityPostCommentFromSupabase(
    Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return CommunityPostComment(
      id: data['id'] as String?,
      post: await CommunityPostAdapter().fromSupabase(data['post'],
          provider: provider, repository: repository),
      userProfile: data['user_profile'] == null
          ? null
          : await UserProfileAdapter().fromSupabase(data['user_profile'],
              provider: provider, repository: repository),
      comment: data['comment'] as String,
      createdAt: data['created_at'] == null
          ? null
          : DateTime.tryParse(data['created_at'] as String));
}

Future<Map<String, dynamic>> _$CommunityPostCommentToSupabase(
    CommunityPostComment instance,
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
    'comment': instance.comment,
    'created_at': instance.createdAt.toIso8601String()
  };
}

Future<CommunityPostComment> _$CommunityPostCommentFromSqlite(
    Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return CommunityPostComment(
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
      comment: data['comment'] as String,
      createdAt: DateTime.parse(data['created_at'] as String))
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$CommunityPostCommentToSqlite(
    CommunityPostComment instance,
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
    'comment': instance.comment,
    'created_at': instance.createdAt.toIso8601String()
  };
}

/// Construct a [CommunityPostComment]
class CommunityPostCommentAdapter
    extends OfflineFirstWithSupabaseAdapter<CommunityPostComment> {
  CommunityPostCommentAdapter();

  @override
  final supabaseTableName = 'community_post_comments';
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
    'comment': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'comment',
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
    'comment': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'comment',
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
      CommunityPostComment instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `CommunityPostComment` WHERE id = ? LIMIT 1''',
        [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'CommunityPostComment';

  @override
  Future<CommunityPostComment> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$CommunityPostCommentFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(CommunityPostComment input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$CommunityPostCommentToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<CommunityPostComment> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$CommunityPostCommentFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(CommunityPostComment input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$CommunityPostCommentToSqlite(input,
          provider: provider, repository: repository);
}
