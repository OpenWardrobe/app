import 'package:hive/hive.dart';

part 'user_profile.g.dart';

@HiveType(typeId: 4)
class UserProfile extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String username;

  @HiveField(2)
  String? displayName;

  @HiveField(3)
  String? bio;

  @HiveField(4)
  String? avatarUrl;

  @HiveField(5)
  Map<String, dynamic>? socialLinks;

  @HiveField(6)
  bool isPublic;

  UserProfile({
    required this.id,
    required this.username,
    this.displayName,
    this.bio,
    this.avatarUrl,
    this.socialLinks,
    this.isPublic = true,
  });

  // Convert JSON to UserProfile
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      username: json['username'],
      displayName: json['display_name'],
      bio: json['bio'],
      avatarUrl: json['avatar_url'],
      socialLinks: json['social_links'] != null ? Map<String, dynamic>.from(json['social_links']) : null,
      isPublic: json['is_public'] ?? true,
    );
  }

  // Convert UserProfile to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'display_name': displayName,
      'bio': bio,
      'avatar_url': avatarUrl,
      'social_links': socialLinks,
      'is_public': isPublic,
    };
  }
}
