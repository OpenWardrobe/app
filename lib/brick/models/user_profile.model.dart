import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'user_profiles'),
  sqliteConfig: SqliteSerializable(),
)
class UserProfile extends OfflineFirstWithSupabaseModel {
  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;
  final String username;
  final String? displayName;
  final String? bio;
  final String? avatarUrl;
  final Map<String, dynamic>? socialLinks;
  final bool isPublic;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserProfile({
    required this.id,
    required this.username,
    this.displayName,
    this.bio,
    this.avatarUrl,
    this.socialLinks,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : isPublic = isPublic ?? true,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();
}

