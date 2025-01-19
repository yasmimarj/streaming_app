import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final int id;
  final MovieAttributes attributes;

  Movie({
    required this.id,
    required this.attributes,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
  @override
  String toString() {
    return 'Movie(id: $id, attributes: $attributes)';
  }
}

@JsonSerializable()
class MovieAttributes {
  final String name;
  final String synopsis;
  final bool currently_playing;
  final String stream_link;
  final String genre;
  final DateTime end_date;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  MovieAttributes({
    required this.name,
    required this.synopsis,
    required this.currently_playing,
    required this.stream_link,
    required this.genre,
    required this.end_date,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  factory MovieAttributes.fromJson(Map<String, dynamic> json) =>
      _$MovieAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$MovieAttributesToJson(this);

  @override
  String toString() {
    return 'MovieAttributes(name: $name, synopsis: $synopsis, '
        'currently_playing: $currently_playing, stream_link: $stream_link, '
        'genre: $genre, end_date: $end_date, createdAt: $createdAt, '
        'updatedAt: $updatedAt, publishedAt: $publishedAt)';
  }
}
