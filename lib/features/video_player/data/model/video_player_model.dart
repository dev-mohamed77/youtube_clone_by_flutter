// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class VideoPlayerModel extends Equatable {
  final bool status;
  final VideoPlayerDataModel result;
  const VideoPlayerModel({
    required this.status,
    required this.result,
  });

  VideoPlayerModel copyWith({
    bool? status,
    VideoPlayerDataModel? result,
  }) {
    return VideoPlayerModel(
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

  factory VideoPlayerModel.fromMap(Map<String, dynamic> map) {
    return VideoPlayerModel(
      status: map['status'] as bool,
      result:
          VideoPlayerDataModel.fromMap(map['result'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoPlayerModel.fromJson(String source) =>
      VideoPlayerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, result];
}

class VideoPlayerDataModel extends Equatable {
  final String id;
  final UserVideo user;
  final String title;
  final String description;
  final int views;
  final String url;
  final String imageUrl;
  final String duration;
  final String likes;
  final bool likeStatus;
  final String desLike;
  final bool desLikeStatus;
  final String createdAt;
  final String? updatedAt;

  const VideoPlayerDataModel({
    required this.id,
    required this.user,
    required this.title,
    required this.description,
    required this.views,
    required this.url,
    required this.imageUrl,
    required this.duration,
    required this.likes,
    required this.likeStatus,
    required this.desLike,
    required this.desLikeStatus,
    required this.createdAt,
    this.updatedAt,
  });

  VideoPlayerDataModel copyWith({
    String? id,
    UserVideo? user,
    String? title,
    String? description,
    int? views,
    String? url,
    String? imageUrl,
    String? duration,
    String? likes,
    bool? likeStatus,
    String? desLike,
    bool? desLikeStatus,
    String? createdAt,
    String? updatedAt,
  }) {
    return VideoPlayerDataModel(
      id: id ?? this.id,
      user: user ?? this.user,
      title: title ?? this.title,
      description: description ?? this.description,
      views: views ?? this.views,
      url: url ?? this.url,
      imageUrl: imageUrl ?? this.imageUrl,
      duration: duration ?? this.duration,
      likes: likes ?? this.likes,
      likeStatus: likeStatus ?? this.likeStatus,
      desLike: desLike ?? this.desLike,
      desLikeStatus: desLikeStatus ?? this.desLikeStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user.toMap(),
      'title': title,
      'description': description,
      'views': views,
      'url': url,
      'image_url': imageUrl,
      'duration': duration,
      'likes': likes,
      'like_status': likeStatus,
      'desLike': desLike,
      'desLike_status': desLikeStatus,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory VideoPlayerDataModel.fromMap(Map<String, dynamic> map) {
    return VideoPlayerDataModel(
      id: map['id'] ?? "",
      user: UserVideo.fromMap(map['user'] as Map<String, dynamic>),
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      views: map['views'] ?? 0,
      url: map['url'] ?? "",
      imageUrl: map['image_url'] ?? "",
      duration: map['duration'] ?? "",
      likes: map['likes'] ?? "",
      likeStatus: map['like_status'] ?? false,
      desLike: map['desLike'] ?? "",
      desLikeStatus: map['desLike_status'] ?? false,
      createdAt: map['created_at'] ?? "",
      updatedAt: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoPlayerDataModel.fromJson(String source) =>
      VideoPlayerDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      user,
      title,
      description,
      views,
      url,
      imageUrl,
      duration,
      likes,
      likeStatus,
      desLike,
      desLikeStatus,
      createdAt,
      updatedAt!,
    ];
  }
}

class UserVideo extends Equatable {
  final String id;
  final String fullname;
  final String username;
  final String email;
  final String imageUrl;

  const UserVideo({
    required this.id,
    required this.fullname,
    required this.username,
    required this.email,
    required this.imageUrl,
  });

  @override
  List<Object> get props {
    return [
      id,
      fullname,
      username,
      email,
      imageUrl,
    ];
  }

  UserVideo copyWith({
    String? id,
    String? fullname,
    String? username,
    String? email,
    String? imageUrl,
  }) {
    return UserVideo(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      username: username ?? this.username,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': id,
      'user_fullname': fullname,
      'users_username': username,
      'users_email': email,
      'users_image_url': imageUrl,
    };
  }

  factory UserVideo.fromMap(Map<String, dynamic> map) {
    return UserVideo(
      id: map['user_id'] as String,
      fullname: map['user_fullname'] as String,
      username: map['users_username'] as String,
      email: map['users_email'] as String,
      imageUrl: map['users_image_url'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory UserVideo.fromJson(String source) =>
      UserVideo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
