import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';
import 'package:openwardrobe/brick/models/user_profile.model.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'community_posts'),
  sqliteConfig: SqliteSerializable(),
)
class CommunityPost extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;
  
  @Supabase(foreignKey: 'user_profile_id')
  final UserProfile? userProfile;
  
  final String content;
  final String? imageUrl;
  final bool isPublic;
  final DateTime createdAt;
  final DateTime updatedAt;

  CommunityPost({
    String? id,
    required this.userProfile,
    required this.content,
    this.imageUrl,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : id = id ?? const Uuid().v4(),
       isPublic = isPublic ?? true,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();
}
