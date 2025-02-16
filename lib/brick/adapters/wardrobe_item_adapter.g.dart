// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<WardrobeItem> _$WardrobeItemFromSupabase(Map<String, dynamic> data,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return WardrobeItem(
      id: data['id'] as String?,
      userProfile: await UserProfileAdapter().fromSupabase(data['user_profile'],
          provider: provider, repository: repository),
      brand: data['brand'] == null
          ? null
          : await BrandAdapter().fromSupabase(data['brand'],
              provider: provider, repository: repository),
      itemCategory: data['item_category'] == null
          ? null
          : await ItemCategoryAdapter().fromSupabase(data['item_category'],
              provider: provider, repository: repository),
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
      imagePath: data['image_path'] as String);
}

Future<Map<String, dynamic>> _$WardrobeItemToSupabase(WardrobeItem instance,
    {required SupabaseProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'user_profile': await UserProfileAdapter().toSupabase(instance.userProfile,
        provider: provider, repository: repository),
    'brand': instance.brand != null
        ? await BrandAdapter().toSupabase(instance.brand!,
            provider: provider, repository: repository)
        : null,
    'item_category': instance.itemCategory != null
        ? await ItemCategoryAdapter().toSupabase(instance.itemCategory!,
            provider: provider, repository: repository)
        : null,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String(),
    'deleted_at': instance.deletedAt?.toIso8601String(),
    'image_path': instance.imagePath
  };
}

Future<WardrobeItem> _$WardrobeItemFromSqlite(Map<String, dynamic> data,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return WardrobeItem(
      id: data['id'] as String,
      userProfile: (await repository!.getAssociation<UserProfile>(
        Query.where(
            'primaryKey', data['user_profile_UserProfile_brick_id'] as int,
            limit1: true),
      ))!
          .first,
      brand: data['brand_Brand_brick_id'] == null
          ? null
          : (data['brand_Brand_brick_id'] > -1
              ? (await repository.getAssociation<Brand>(
                  Query.where('primaryKey', data['brand_Brand_brick_id'] as int,
                      limit1: true),
                ))
                  ?.first
              : null),
      itemCategory: data['item_category_ItemCategory_brick_id'] == null
          ? null
          : (data['item_category_ItemCategory_brick_id'] > -1
              ? (await repository.getAssociation<ItemCategory>(
                  Query.where('primaryKey',
                      data['item_category_ItemCategory_brick_id'] as int,
                      limit1: true),
                ))
                  ?.first
              : null),
      createdAt: DateTime.parse(data['created_at'] as String),
      updatedAt: DateTime.parse(data['updated_at'] as String),
      deletedAt: data['deleted_at'] == null
          ? null
          : data['deleted_at'] == null
              ? null
              : DateTime.tryParse(data['deleted_at'] as String),
      imagePath: data['image_path'] as String)
    ..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$WardrobeItemToSqlite(WardrobeItem instance,
    {required SqliteProvider provider,
    OfflineFirstWithSupabaseRepository? repository}) async {
  return {
    'id': instance.id,
    'user_profile_UserProfile_brick_id': instance.userProfile.primaryKey ??
        await provider.upsert<UserProfile>(instance.userProfile,
            repository: repository),
    'brand_Brand_brick_id': instance.brand != null
        ? instance.brand!.primaryKey ??
            await provider.upsert<Brand>(instance.brand!,
                repository: repository)
        : null,
    'item_category_ItemCategory_brick_id': instance.itemCategory != null
        ? instance.itemCategory!.primaryKey ??
            await provider.upsert<ItemCategory>(instance.itemCategory!,
                repository: repository)
        : null,
    'created_at': instance.createdAt.toIso8601String(),
    'updated_at': instance.updatedAt.toIso8601String(),
    'deleted_at': instance.deletedAt?.toIso8601String(),
    'image_path': instance.imagePath
  };
}

/// Construct a [WardrobeItem]
class WardrobeItemAdapter
    extends OfflineFirstWithSupabaseAdapter<WardrobeItem> {
  WardrobeItemAdapter();

  @override
  final supabaseTableName = 'wardrobe_item';
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
      associationIsNullable: false,
      foreignKey: 'user_profile_id',
    ),
    'brand': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'brand',
      associationType: Brand,
      associationIsNullable: true,
      foreignKey: 'brand_id',
    ),
    'itemCategory': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'item_category',
      associationType: ItemCategory,
      associationIsNullable: true,
      foreignKey: 'category_id',
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
    'imagePath': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'image_path',
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
    'brand': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'brand_Brand_brick_id',
      iterable: false,
      type: Brand,
    ),
    'itemCategory': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'item_category_ItemCategory_brick_id',
      iterable: false,
      type: ItemCategory,
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
    'imagePath': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'image_path',
      iterable: false,
      type: String,
    )
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
      WardrobeItem instance, DatabaseExecutor executor) async {
    final results = await executor.rawQuery('''
        SELECT * FROM `WardrobeItem` WHERE id = ? LIMIT 1''', [instance.id]);

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'WardrobeItem';

  @override
  Future<WardrobeItem> fromSupabase(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$WardrobeItemFromSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSupabase(WardrobeItem input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$WardrobeItemToSupabase(input,
          provider: provider, repository: repository);
  @override
  Future<WardrobeItem> fromSqlite(Map<String, dynamic> input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$WardrobeItemFromSqlite(input,
          provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(WardrobeItem input,
          {required provider,
          covariant OfflineFirstWithSupabaseRepository? repository}) async =>
      await _$WardrobeItemToSqlite(input,
          provider: provider, repository: repository);
}
