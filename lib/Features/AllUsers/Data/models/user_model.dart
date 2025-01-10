import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? role;
  final String? profileImage;
  final String? introVideo;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.role,
    this.profileImage,
    this.introVideo,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      id: jsonData['id'] as int?,
      name: jsonData['name'] as String?,
      email: jsonData['email'] as String?,
      phone: jsonData['phone'] as String?,
      role: jsonData['role'] as String?,
      profileImage: jsonData['profile_image'] as String?,
      introVideo: jsonData['intro_video'] as String?,
      createdAt: jsonData['created_at'] == null
          ? null
          : DateTime.parse(jsonData['created_at'] as String),
      updatedAt: jsonData['updated_at'] == null
          ? null
          : DateTime.parse(jsonData['updated_at'] as String),
    );
  }

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'name': name,
  //       'email': email,
  //       'phone': phone,
  //       'role': role,
  //       'profile_image': profileImage,
  //       'intro_video': introVideo,
  //       'created_at': createdAt?.toIso8601String(),
  //       'updated_at': updatedAt?.toIso8601String(),
  //     };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phone,
      role,
      profileImage,
      introVideo,
      createdAt,
      updatedAt,
    ];
  }
}
