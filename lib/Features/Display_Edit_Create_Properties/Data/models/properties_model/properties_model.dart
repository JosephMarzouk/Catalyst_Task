import 'package:equatable/equatable.dart';

import 'user.dart';

class PropertiesModel extends Equatable {
  final int? id;
  final int? userId;
  final String? name;
  final String? description;
  final String? price;
  final String? location;
  final String? images;
  final String? video;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final User? user;

  const PropertiesModel({
    this.id,
    this.userId,
    this.name,
    this.description,
    this.price,
    this.location,
    this.images,
    this.video,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory PropertiesModel.fromJson(Map<String, dynamic> json) {
    return PropertiesModel(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      location: json['location'] as String?,
      images: json['images'] as String?,
      video: json['video'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'name': name,
        'description': description,
        'price': price,
        'location': location,
        'images': images,
        'video': video,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      name,
      description,
      price,
      location,
      images,
      video,
      createdAt,
      updatedAt,
      user,
    ];
  }
}
