import 'package:json_annotation/json_annotation.dart';

part 'api_user.g.dart';

@JsonSerializable()
class ApiUser {
  final int id;
  final String username;
  final String email;
  final String provider;
  final bool confirmed;
  final bool blocked;
  final DateTime createdAt;
  final DateTime updatedAt;

  ApiUser({
    required this.id,
    required this.username,
    required this.email,
    required this.provider,
    required this.confirmed,
    required this.blocked,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ApiUser.fromJson(Map<String, dynamic> json) =>
      _$ApiUserFromJson(json);
  Map<String, dynamic> toJson() => _$ApiUserToJson(this);

  @override
  String toString() {
    return 'ID: $id, Username: $username, Email: $email, Provider: $provider, '
        'Confirmed: $confirmed, Blocked: $blocked, '
        'Created At: $createdAt, Updated At: $updatedAt';
  }
}
