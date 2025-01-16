import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final int id;
  final String username;
  final String email;
  final String provider;
  final bool confirmed;
  final bool blocked;
  final String createdAt;
  final String updatedAt;
  final Role role;

  RegisterResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.provider,
    required this.confirmed,
    required this.blocked,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
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

  Role({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
