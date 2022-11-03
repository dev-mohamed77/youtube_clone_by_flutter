// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AddCommentModel extends Equatable {
  final String commentID;
  final String userID;
  final String videoID;
  final String title;
  final String createdAt;
  final String updatedAt;

  const AddCommentModel({
    required this.commentID,
    required this.userID,
    required this.videoID,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  AddCommentModel copyWith({
    String? commentID,
    String? userID,
    String? videoID,
    String? title,
    String? createdAt,
    String? updatedAt,
  }) {
    return AddCommentModel(
      commentID: commentID ?? this.commentID,
      userID: userID ?? this.userID,
      videoID: videoID ?? this.videoID,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'comments_id': commentID,
      'comments_user_id': userID,
      'comments_videos_id': videoID,
      'comments_title': title,
      'comments_created_at': createdAt,
      'comments_updated_at': updatedAt,
    };
  }

  factory AddCommentModel.fromMap(Map<String, dynamic> map) {
    return AddCommentModel(
      commentID: map['comments_id'] ?? "",
      userID: map['comments_user_id'] ?? "",
      videoID: map['comments_videos_id'] ?? "",
      title: map['comments_title'] ?? "",
      createdAt: map['comments_created_at'] ?? "",
      updatedAt: map['comments_updated_at'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory AddCommentModel.fromJson(String source) =>
      AddCommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      commentID,
      userID,
      videoID,
      title,
      createdAt,
      updatedAt,
    ];
  }
}
