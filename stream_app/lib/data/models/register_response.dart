import 'package:json_annotation/json_annotation.dart';
import 'package:untold/data/models/api_user.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final String jwt;
  final ApiUser apiUser;

  RegisterResponse({
    required this.jwt,
    required this.apiUser,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class Role {
  final int id;
  final String name;
  final String description;
  final String type;
  final DateTime createdAt;
  final DateTime updatedAt;

  Role({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
