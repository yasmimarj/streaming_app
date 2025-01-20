import 'package:json_annotation/json_annotation.dart';

part 'like.g.dart';

@JsonSerializable()
class Like {
  final int id;
  final LikeAttributes attributes;

  Like({
    required this.id,
    required this.attributes,
  });

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
  Map<String, dynamic> toJson() => _$LikeToJson(this);
  @override
  String toString() {
    return 'Like(id: $id, attributes: $attributes)';
  }
}

@JsonSerializable()
class LikeAttributes {
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  LikeAttributes({
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  factory LikeAttributes.fromJson(Map<String, dynamic> json) =>
      _$LikeAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$LikeAttributesToJson(this);

  @override
  String toString() {
    return 'LikeAttributes(createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt)';
  }
}
