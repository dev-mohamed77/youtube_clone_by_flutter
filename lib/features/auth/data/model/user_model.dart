// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final bool status;
  final UserData? user;
  const User({
    required this.status,
    required this.user,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      status: json["status"] ?? false,
      user: json["result"] != null ? UserData.fromJson(json["result"]) : null,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "status": status,
      "result": user,
    };
  }

  @override
  List<Object?> get props => [status, user];
}

class UserData extends Equatable {
  final String id;
  final String fullname;
  final String username;
  final String email;
  final String image;
  final String gender;
  final bool isGoogle;
  final String createdAt;
  final String updatedAt;
  final String token;
  const UserData({
    required this.id,
    required this.fullname,
    required this.username,
    required this.email,
    required this.image,
    required this.gender,
    required this.isGoogle,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json["id"] ?? "",
      fullname: json["fullname"] ?? "",
      username: json["username"] ?? "",
      email: json["email"] ?? "",
      image: json["image_url"] ?? "",
      gender: json["gender"] ?? "",
      isGoogle: json["is_google"] ?? "",
      createdAt: json["created_at"] ?? "",
      updatedAt: json["updated_at"] ?? "",
      token: json["token"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "fullname": fullname,
      "username": username,
      "email": email,
      "image_url": image,
      "gender": gender,
      "is_google": isGoogle,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "token": token,
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      fullname,
      username,
      email,
      image,
      gender,
      isGoogle,
      createdAt,
      updatedAt,
      token,
    ];
  }
}
