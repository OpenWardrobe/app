// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_core/query.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_sqlite/db.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_sqlite/brick_sqlite.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:brick_supabase/brick_supabase.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:uuid/uuid.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:openwardrobe/brick/models/community_post.model.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:openwardrobe/brick/models/user_profile.model.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:openwardrobe/brick/models/wardrobe_item.model.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:openwardrobe/brick/models/outfit_item.model.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:openwardrobe/brick/models/brand.model.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:openwardrobe/brick/models/item_category.model.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:openwardrobe/brick/models/outfit.model.dart';
// ignore: unused_import, unused_shown_name, unnecessary_import
import 'package:openwardrobe/brick/models/lookbook.model.dart';// GENERATED CODE DO NOT EDIT
// ignore: unused_import
import 'dart:convert';
import 'package:brick_sqlite/brick_sqlite.dart' show SqliteModel, SqliteAdapter, SqliteModelDictionary, RuntimeSqliteColumnDefinition, SqliteProvider;
import 'package:brick_supabase/brick_supabase.dart' show SupabaseProvider, SupabaseModel, SupabaseAdapter, SupabaseModelDictionary;
// ignore: unused_import, unused_shown_name
import 'package:brick_offline_first/brick_offline_first.dart' show RuntimeOfflineFirstDefinition;
// ignore: unused_import, unused_shown_name
import 'package:sqflite_common/sqlite_api.dart' show DatabaseExecutor;

import '../brick/models/community_post_like.model.dart';
import '../brick/models/community_post_comment.model.dart';
import '../brick/models/use_item.model.dart';
import '../brick/models/outfit.model.dart';
import '../brick/models/user_profile.model.dart';
import '../brick/models/wardrobe_item.model.dart';
import '../brick/models/use_outfit.model.dart';
import '../brick/models/brand.model.dart';
import '../brick/models/outfit_item.model.dart';
import '../brick/models/lookbook.model.dart';
import '../brick/models/item_metadata.model.dart';
import '../brick/models/lookbook_item.model.dart';
import '../brick/models/item_category.model.dart';
import '../brick/models/community_post.model.dart';

part 'adapters/community_post_like_adapter.g.dart';
part 'adapters/community_post_comment_adapter.g.dart';
part 'adapters/use_item_adapter.g.dart';
part 'adapters/outfit_adapter.g.dart';
part 'adapters/user_profile_adapter.g.dart';
part 'adapters/wardrobe_item_adapter.g.dart';
part 'adapters/use_outfit_adapter.g.dart';
part 'adapters/brand_adapter.g.dart';
part 'adapters/outfit_item_adapter.g.dart';
part 'adapters/lookbook_adapter.g.dart';
part 'adapters/item_metadata_adapter.g.dart';
part 'adapters/lookbook_item_adapter.g.dart';
part 'adapters/item_category_adapter.g.dart';
part 'adapters/community_post_adapter.g.dart';

/// Supabase mappings should only be used when initializing a [SupabaseProvider]
final Map<Type, SupabaseAdapter<SupabaseModel>> supabaseMappings = {
  CommunityPostLike: CommunityPostLikeAdapter(),
  CommunityPostComment: CommunityPostCommentAdapter(),
  UseItem: UseItemAdapter(),
  Outfit: OutfitAdapter(),
  UserProfile: UserProfileAdapter(),
  WardrobeItem: WardrobeItemAdapter(),
  UseOutfit: UseOutfitAdapter(),
  Brand: BrandAdapter(),
  OutfitItem: OutfitItemAdapter(),
  Lookbook: LookbookAdapter(),
  ItemMetadata: ItemMetadataAdapter(),
  LookbookItem: LookbookItemAdapter(),
  ItemCategory: ItemCategoryAdapter(),
  CommunityPost: CommunityPostAdapter()
};
final supabaseModelDictionary = SupabaseModelDictionary(supabaseMappings);

/// Sqlite mappings should only be used when initializing a [SqliteProvider]
final Map<Type, SqliteAdapter<SqliteModel>> sqliteMappings = {
  CommunityPostLike: CommunityPostLikeAdapter(),
  CommunityPostComment: CommunityPostCommentAdapter(),
  UseItem: UseItemAdapter(),
  Outfit: OutfitAdapter(),
  UserProfile: UserProfileAdapter(),
  WardrobeItem: WardrobeItemAdapter(),
  UseOutfit: UseOutfitAdapter(),
  Brand: BrandAdapter(),
  OutfitItem: OutfitItemAdapter(),
  Lookbook: LookbookAdapter(),
  ItemMetadata: ItemMetadataAdapter(),
  LookbookItem: LookbookItemAdapter(),
  ItemCategory: ItemCategoryAdapter(),
  CommunityPost: CommunityPostAdapter()
};
final sqliteModelDictionary = SqliteModelDictionary(sqliteMappings);
