// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ProfileModel extends Equatable {
  final bool status;
  final Result result;

  const ProfileModel({
    required this.status,
    required this.result,
  });

  ProfileModel copyWith({
    bool? status,
    Result? result,
  }) {
    return ProfileModel(
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

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      status: map['status'] ?? false,
      result: Result.fromMap(map['result'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProfileModel(status: $status, result: $result)';

  @override
  bool operator ==(covariant ProfileModel other) {
    if (identical(this, other)) return true;

    return other.status == status && other.result == result;
  }

  @override
  int get hashCode => status.hashCode ^ result.hashCode;

  @override
  List<Object> get props => [status, result];
}

class Result extends Equatable {
  final ProfileData user;
  final List<ProfileVideos> videos;
  final ProfileSubscribers subscribers;

  const Result({
    required this.user,
    required this.videos,
    required this.subscribers,
  });

  Result copyWith({
    ProfileData? user,
    List<ProfileVideos>? videos,
    ProfileSubscribers? subscribers,
  }) {
    return Result(
      user: user ?? this.user,
      videos: videos ?? this.videos,
      subscribers: subscribers ?? this.subscribers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'videos': videos.map((x) => x.toMap()).toList(),
      'subscribers': subscribers.toMap(),
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      user: ProfileData.fromMap(map['user'] as Map<String, dynamic>),
      videos: List<ProfileVideos>.from(
        (map['videos']).map<ProfileVideos>(
          (x) => ProfileVideos.fromMap(x as Map<String, dynamic>),
        ),
      ),
      subscribers: ProfileSubscribers.fromMap(
          map['subscribers'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) =>
      Result.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Result(user: $user, videos: $videos)';

  @override
  bool operator ==(covariant Result other) {
    if (identical(this, other)) return true;

    return other.user == user && listEquals(other.videos, videos);
  }

  @override
  int get hashCode => user.hashCode ^ videos.hashCode;

  @override
  List<Object> get props => [user, videos, subscribers];

  @override
  bool get stringify => true;
}

class ProfileSubscribers extends Equatable {
  final String count;
  final bool status;

  const ProfileSubscribers({
    required this.count,
    required this.status,
  });

  ProfileSubscribers copyWith({
    String? count,
    bool? status,
  }) {
    return ProfileSubscribers(
      count: count ?? this.count,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'status': status,
    };
  }

  factory ProfileSubscribers.fromMap(Map<String, dynamic> map) {
    return ProfileSubscribers(
      count: map['count'] ?? "",
      status: map['status'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileSubscribers.fromJson(String source) =>
      ProfileSubscribers.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [count, status];
}

class ProfileData extends Equatable {
  final String userID;
  final String fullname;
  final String username;
  final String email;
  final String imageUrl;
  final String gender;
  final bool isGoogle;
  final String createdAt;
  final String updatedAt;

  const ProfileData({
    required this.userID,
    required this.fullname,
    required this.username,
    required this.email,
    required this.imageUrl,
    required this.gender,
    required this.isGoogle,
    required this.createdAt,
    required this.updatedAt,
  });

  ProfileData copyWith({
    String? userID,
    String? fullname,
    String? username,
    String? email,
    String? imageUrl,
    String? gender,
    bool? isGoogle,
    String? createdAt,
    String? updatedAt,
  }) {
    return ProfileData(
      userID: userID ?? this.userID,
      fullname: fullname ?? this.fullname,
      username: username ?? this.username,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      gender: gender ?? this.gender,
      isGoogle: isGoogle ?? this.isGoogle,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'users_id': userID,
      'users_fullname': fullname,
      'users_username': username,
      'users_email': email,
      'users_image_url': imageUrl,
      'users_gender': gender,
      'users_is_google': isGoogle,
      'users_created_at': createdAt,
      'users_update_at': updatedAt,
    };
  }

  factory ProfileData.fromMap(Map<String, dynamic> map) {
    return ProfileData(
      userID: map['users_id'] ?? "",
      fullname: map['users_fullname'] ?? "",
      username: map['users_username'] ?? "",
      email: map['users_email'] ?? "",
      imageUrl: map['users_image_url'] ?? "",
      gender: map['users_gender'] ?? "",
      isGoogle: map['users_is_google'] ?? false,
      createdAt: map['users_created_at'] ?? "",
      updatedAt: map['users_update_at'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileData.fromJson(String source) =>
      ProfileData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileData(userID: $userID, fullname: $fullname, username: $username, email: $email, imageUrl: $imageUrl, gender: $gender, isGoogle: $isGoogle, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant ProfileData other) {
    if (identical(this, other)) return true;

    return other.userID == userID &&
        other.fullname == fullname &&
        other.username == username &&
        other.email == email &&
        other.imageUrl == imageUrl &&
        other.gender == gender &&
        other.isGoogle == isGoogle &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return userID.hashCode ^
        fullname.hashCode ^
        username.hashCode ^
        email.hashCode ^
        imageUrl.hashCode ^
        gender.hashCode ^
        isGoogle.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  @override
  List<Object> get props {
    return [
      userID,
      fullname,
      username,
      email,
      imageUrl,
      gender,
      isGoogle,
      createdAt,
      updatedAt,
    ];
  }
}

class ProfileVideos extends Equatable {
  final String videosID;
  final ProfileVideosUser userVideo;
  final String title;
  final String description;
  final int views;
  final String url;
  final String duration;
  final String imageUrl;
  final String createdAt;
  final String updatedAt;

  const ProfileVideos({
    required this.videosID,
    required this.userVideo,
    required this.title,
    required this.description,
    required this.views,
    required this.url,
    required this.duration,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  ProfileVideos copyWith({
    String? videosID,
    ProfileVideosUser? userVideo,
    String? title,
    String? description,
    int? views,
    String? url,
    String? duration,
    String? imageUrl,
    String? createdAt,
    String? updatedAt,
  }) {
    return ProfileVideos(
      videosID: videosID ?? this.videosID,
      userVideo: userVideo ?? this.userVideo,
      title: title ?? this.title,
      description: description ?? this.description,
      views: views ?? this.views,
      url: url ?? this.url,
      duration: duration ?? this.duration,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'videos_id': videosID,
      'user_video': userVideo.toMap(),
      'videos_title': title,
      'videos_description': description,
      'videos_views': views,
      'videos_url': url,
      'duration': duration,
      'videos_image_url': imageUrl,
      'videos_created_at': createdAt,
      'videos_update_at': updatedAt,
    };
  }

  factory ProfileVideos.fromMap(Map<String, dynamic> map) {
    return ProfileVideos(
      videosID: map['videos_id'] ?? "",
      userVideo:
          ProfileVideosUser.fromMap(map['user_video'] as Map<String, dynamic>),
      title: map['videos_title'] ?? "",
      description: map['videos_description'] ?? "",
      views: map['videos_views'] ?? 0,
      url: map['videos_url'] ?? "",
      duration: map['duration'] ?? "",
      imageUrl: map['videos_image_url'] ?? "",
      createdAt: map['videos_created_at'] ?? "",
      updatedAt: map['videos_update_at'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileVideos.fromJson(String source) =>
      ProfileVideos.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileVideos(videosID: $videosID, userVideo: $userVideo, title: $title, description: $description, views: $views, url: $url, duration: $duration, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant ProfileVideos other) {
    if (identical(this, other)) return true;

    return other.videosID == videosID &&
        other.userVideo == userVideo &&
        other.title == title &&
        other.description == description &&
        other.views == views &&
        other.url == url &&
        other.duration == duration &&
        other.imageUrl == imageUrl &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return videosID.hashCode ^
        userVideo.hashCode ^
        title.hashCode ^
        description.hashCode ^
        views.hashCode ^
        url.hashCode ^
        duration.hashCode ^
        imageUrl.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  @override
  List<Object> get props {
    return [
      videosID,
      userVideo,
      title,
      description,
      views,
      url,
      duration,
      imageUrl,
      createdAt,
      updatedAt,
    ];
  }
}

class ProfileVideosUser extends Equatable {
  final String userID;
  final String username;
  final String fullname;
  final String email;
  final String imageUrl;

  const ProfileVideosUser({
    required this.userID,
    required this.username,
    required this.fullname,
    required this.email,
    required this.imageUrl,
  });

  ProfileVideosUser copyWith({
    String? userID,
    String? username,
    String? fullname,
    String? email,
    String? imageUrl,
  }) {
    return ProfileVideosUser(
      userID: userID ?? this.userID,
      username: username ?? this.username,
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'users_id': userID,
      'users_username': username,
      'users_fullname': fullname,
      'users_email': email,
      'users_image_url': imageUrl,
    };
  }

  factory ProfileVideosUser.fromMap(Map<String, dynamic> map) {
    return ProfileVideosUser(
      userID: map['users_id'] ?? "",
      username: map['users_username'] ?? "",
      fullname: map['users_fullname'] ?? "",
      email: map['users_email'] ?? "",
      imageUrl: map['users_image_url'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileVideosUser.fromJson(String source) =>
      ProfileVideosUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileVideosUser(users_id: $userID, users_username: $username, users_fullname: $fullname, users_email: $email, users_image_url: $imageUrl)';
  }

  @override
  bool operator ==(covariant ProfileVideosUser other) {
    if (identical(this, other)) return true;

    return other.userID == userID &&
        other.username == username &&
        other.fullname == fullname &&
        other.email == email &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return userID.hashCode ^
        username.hashCode ^
        fullname.hashCode ^
        email.hashCode ^
        imageUrl.hashCode;
  }

  @override
  List<Object> get props {
    return [
      userID,
      username,
      fullname,
      email,
      imageUrl,
    ];
  }
}
