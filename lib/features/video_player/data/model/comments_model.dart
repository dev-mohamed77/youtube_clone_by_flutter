// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  final String commentID;
  final CommentUser commentUser;
  final String videoID;
  final String title;
  final String? createdAt;
  final String? updatedAt;

  const CommentModel({
    required this.commentID,
    required this.commentUser,
    required this.videoID,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  CommentModel copyWith({
    String? commentID,
    CommentUser? commentUser,
    String? videoID,
    String? title,
    String? createdAt,
    String? updatedAt,
  }) {
    return CommentModel(
      commentID: commentID ?? this.commentID,
      commentUser: commentUser ?? this.commentUser,
      videoID: videoID ?? this.videoID,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'comments_id': commentID,
      'comments_user': commentUser.toMap(),
      'comments_videos_id': videoID,
      'comments_title': title,
      'comments_created_at': createdAt,
      'comments_updated_at': updatedAt,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      commentID: map['comments_id'] ?? "",
      commentUser:
          CommentUser.fromMap(map['comments_user'] as Map<String, dynamic>),
      videoID: map['comments_videos_id'] ?? "",
      title: map['comments_title'] ?? "",
      createdAt: map['comments_created_at'] ?? "",
      updatedAt: map['comments_updated_at'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      commentID,
      commentUser,
      videoID,
      title,
      createdAt!,
      updatedAt!,
    ];
  }
}

class CommentUser extends Equatable {
  final String userID;
  final String fullname;
  final String username;
  final String email;
  final String imageUrl;

  const CommentUser({
    required this.userID,
    required this.fullname,
    required this.username,
    required this.email,
    required this.imageUrl,
  });

  CommentUser copyWith({
    String? userID,
    String? fullname,
    String? username,
    String? email,
    String? imageUrl,
  }) {
    return CommentUser(
      userID: userID ?? this.userID,
      fullname: fullname ?? this.fullname,
      username: username ?? this.username,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': userID,
      'user_fullname': fullname,
      'users_username': username,
      'users_email': email,
      'users_image_url': imageUrl,
    };
  }

  factory CommentUser.fromMap(Map<String, dynamic> map) {
    return CommentUser(
      userID: map['user_id'] ?? "",
      fullname: map['user_fullname'] ?? "",
      username: map['users_username'] ?? "",
      email: map['users_email'] ?? "",
      imageUrl: map['users_image_url'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentUser.fromJson(String source) =>
      CommentUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      userID,
      fullname,
      username,
      email,
      imageUrl,
    ];
  }
}
