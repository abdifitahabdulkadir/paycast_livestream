// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MovieModel {
  final String? title;
  final String? description;
  final DateTime? releaseYear;
  final String? audioLanaguage;
  final String? subtitleLanguage;
  final MovieCategory? category;
  final String? video_url;
  final List<String?>? actors_images;
  final Duration? duration;
  final String? age;

  MovieModel({
    required this.title,
    required this.description,
    required this.releaseYear,
    required this.audioLanaguage,
    required this.subtitleLanguage,
    required this.category,
    required this.video_url,
    required this.actors_images,
    required this.duration,
    required this.age,
  });

  MovieModel copyWith({
    String? title,
    String? description,
    DateTime? releaseYear,
    String? audioLanaguage,
    String? subtitleLanguage,
    MovieCategory? category,
    String? video_url,
    List<String>? actors_images,
    Duration? duration,
    String? age,
  }) {
    return MovieModel(
      title: title ?? this.title,
      description: description ?? this.description,
      releaseYear: releaseYear ?? this.releaseYear,
      audioLanaguage: audioLanaguage ?? this.audioLanaguage,
      subtitleLanguage: subtitleLanguage ?? this.subtitleLanguage,
      category: category ?? this.category,
      video_url: video_url ?? this.video_url,
      actors_images: actors_images ?? this.actors_images,
      duration: duration ?? this.duration,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'releaseYear': releaseYear?.year,
      'audioLanaguage': audioLanaguage,
      'subtitleLanguage': subtitleLanguage,
      'category': category,
      'video_url': video_url,
      'actors_images': actors_images,
      'duration': duration,
      'age': age,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      age: map["age"] ?? null,
      duration: map["duration"] ?? null,
      title: map['title'] ?? null,
      description: map['description'] ?? null,
      releaseYear: map['releaseYear'] ?? null,
      audioLanaguage: map['audioLanaguage'] ?? null,
      subtitleLanguage: map['subtitleLanguage'] ?? null,
      category: (map['category'] ?? null),
      video_url: map['video_url'] ?? null,
      actors_images: map['actors_images'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieModel(title: $title, description: $description, releaseYear: $releaseYear, audioLanaguage: $audioLanaguage, subtitleLanguage: $subtitleLanguage, category: $category, video_url: $video_url, actors_images: $actors_images, duration: $duration, age: $age)';
  }
}

enum MovieCategory {
  action,
  drama,
  romantic,
  animation,
  release,
}
