// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiUser _$ApiUserFromJson(Map<String, dynamic> json) => ApiUser(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String,
      provider: json['provider'] as String,
      confirmed: json['confirmed'] as bool,
      blocked: json['blocked'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ApiUserToJson(ApiUser instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'provider': instance.provider,
      'confirmed': instance.confirmed,
      'blocked': instance.blocked,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
