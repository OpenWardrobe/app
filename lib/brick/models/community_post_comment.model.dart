import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';
import 'package:openwardrobe/brick/models/community_post.model.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'community_post_comments'),
  sqliteConfig: SqliteSerializable(),
)
class CommunityPostComment extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;
  
  // Association to CommunityPost via post_id
  @Supabase(foreignKey: 'post_id')
  final CommunityPost post;
  
  // Association to UserProfile via user_id
  @Supabase(foreignKey: 'user_profile_id')
  final UserProfile? userProfile;
  
  final String comment;
  final DateTime createdAt;

  CommunityPostComment({
    String? id,
    required this.post,
    required this.userProfile,
    required this.comment,
    DateTime? createdAt,
  }) : id = id ?? const Uuid().v4(),
       createdAt = createdAt ?? DateTime.now();
}
