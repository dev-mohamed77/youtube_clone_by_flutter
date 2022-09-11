// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class VideosModel extends Equatable {
  final bool status;
  final VideosDataModel result;
  const VideosModel({
    required this.status,
    required this.result,
  });

  @override
  List<Object> get props => [status, result];

  VideosModel copyWith({
    bool? status,
    VideosDataModel? result,
  }) {
    return VideosModel(
      status: status ?? this.status,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'result': result.toMap(),
    };
  }

  factory VideosModel.fromMap(Map<String, dynamic> map) {
    return VideosModel(
      status: map['status'] ?? false,
      result: VideosDataModel.fromMap(map['result'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory VideosModel.fromJson(String source) =>
      VideosModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

class VideosDataModel extends Equatable {
  final String id;
  final VideoUser user;
  final String title;
  final String description;
  final int view;
  final String videoUrl;
  final String videoImage;
  final String duration;
  final String createdAt;
  final String updatedAt;

  const VideosDataModel({
    required this.id,
    required this.user,
    required this.title,
    required this.description,
    required this.view,
    required this.videoUrl,
    required this.videoImage,
    required this.duration,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props {
    return [
      id,
      user,
      title,
      description,
      view,
      videoUrl,
      videoImage,
      duration,
      createdAt,
      updatedAt,
    ];
  }

  VideosDataModel copyWith({
    String? id,
    VideoUser? user,
    String? title,
    String? description,
    int? view,
    String? videoUrl,
    String? videoImage,
    String? duration,
    String? createdAt,
    String? updatedAt,
  }) {
    return VideosDataModel(
      id: id ?? this.id,
      user: user ?? this.user,
      title: title ?? this.title,
      description: description ?? this.description,
      view: view ?? this.view,
      videoUrl: videoUrl ?? this.videoUrl,
      videoImage: videoImage ?? this.videoImage,
      duration: duration ?? this.duration,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'videos_id': id,
      'user_id': user.toMap(),
      'videos_title': title,
      'videos_description': description,
      'videos_views': view,
      'videos_url': videoUrl,
      'videos_image_url': videoImage,
      'duration': duration,
      'videos_created_at': createdAt,
      'videos_update_at': updatedAt,
    };
  }

  factory VideosDataModel.fromMap(Map<String, dynamic> map) {
    return VideosDataModel(
      id: map['videos_id'] as String,
      user: VideoUser.fromMap(map['user_video'] as Map<String, dynamic>),
      title: map['videos_title'] ?? "",
      description: map['videos_description'] ?? "",
      view: map['videos_views'] ?? 0,
      videoUrl: map['videos_url'] ?? "",
      videoImage: map['videos_image_url'] ?? "",
      duration: map['duration'] ?? "",
      createdAt: map['videos_created_at'] ?? "",
      updatedAt: map['videos_update_at'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory VideosDataModel.fromJson(String source) =>
      VideosDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

class VideoUser extends Equatable {
  final String id;
  final String fullname;
  final String username;
  final String email;
  final String image;
  const VideoUser({
    required this.id,
    required this.fullname,
    required this.username,
    required this.email,
    required this.image,
  });
  @override
  List<Object> get props {
    return [
      id,
      fullname,
      username,
      email,
      image,
    ];
  }

  VideoUser copyWith({
    String? id,
    String? fullname,
    String? username,
    String? email,
    String? image,
  }) {
    return VideoUser(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      username: username ?? this.username,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': id,
      'user_fullname': fullname,
      'users_username': username,
      'users_email': email,
      'users_image_url': image,
    };
  }

  factory VideoUser.fromMap(Map<String, dynamic> map) {
    return VideoUser(
      id: map['user_id'] ?? "",
      fullname: map['user_fullname'] ?? "",
      username: map['users_username'] ?? "",
      email: map['users_email'] ?? "",
      image: map['users_image_url'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoUser.fromJson(String source) =>
      VideoUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
