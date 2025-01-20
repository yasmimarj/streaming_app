// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: (json['id'] as num).toInt(),
      attributes:
          MovieAttributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

MovieAttributes _$MovieAttributesFromJson(Map<String, dynamic> json) =>
    MovieAttributes(
      name: json['name'] as String,
      synopsis: json['synopsis'] as String,
      currently_playing: json['currently_playing'] as bool,
      stream_link: json['stream_link'] as String,
      genre: json['genre'] as String,
      end_date: DateTime.parse(json['end_date'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      publishedAt: DateTime.parse(json['publishedAt'] as String),
    );

Map<String, dynamic> _$MovieAttributesToJson(MovieAttributes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'synopsis': instance.synopsis,
      'currently_playing': instance.currently_playing,
      'stream_link': instance.stream_link,
      'genre': instance.genre,
      'end_date': instance.end_date.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'publishedAt': instance.publishedAt.toIso8601String(),
    };
