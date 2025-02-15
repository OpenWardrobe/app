import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';
import 'package:openwardrobe/brick/models/community_post.model.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'community_post_likes'),
  sqliteConfig: SqliteSerializable(),
)
class CommunityPostLike extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;
  
  @Supabase(foreignKey: 'post_id')
  final CommunityPost post;
  
  @Supabase(foreignKey: 'user_profile_id')
  final UserProfile? userProfile;
  
  final DateTime createdAt;

  CommunityPostLike({
    String? id,
    required this.post,
    required this.userProfile,
    DateTime? createdAt,
  }) : id = id ?? const Uuid().v4(),
       createdAt = createdAt ?? DateTime.now();
}
