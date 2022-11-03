// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class LikesAndDesLikesModel extends Equatable {
  final bool status;
  final LikesAndDesLikesDataModel result;
  final String message;
  const LikesAndDesLikesModel({
    required this.status,
    required this.result,
    required this.message,
  });

  LikesAndDesLikesModel copyWith({
    bool? status,
    LikesAndDesLikesDataModel? result,
    String? message,
  }) {
    return LikesAndDesLikesModel(
      status: status ?? this.status,
      result: result ?? this.result,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'result': result.toMap(),
      'message': message,
    };
  }

  factory LikesAndDesLikesModel.fromMap(Map<String, dynamic> map) {
    return LikesAndDesLikesModel(
      status: map['status'] as bool,
      result: LikesAndDesLikesDataModel.fromMap(
        map['result'] as Map<String, dynamic>,
      ),
      message: map['message'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory LikesAndDesLikesModel.fromJson(String source) =>
      LikesAndDesLikesModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, result, message];
}

class LikesAndDesLikesDataModel extends Equatable {
  final bool like;
  final bool desLike;
  const LikesAndDesLikesDataModel({
    required this.like,
    required this.desLike,
  });

  LikesAndDesLikesDataModel copyWith({
    bool? like,
    bool? desLike,
  }) {
    return LikesAndDesLikesDataModel(
      like: like ?? this.like,
      desLike: desLike ?? this.desLike,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'like': like,
      'des_like': desLike,
    };
  }

  factory LikesAndDesLikesDataModel.fromMap(Map<String, dynamic> map) {
    return LikesAndDesLikesDataModel(
      like: map['like'] as bool,
      desLike: map['des_like'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LikesAndDesLikesDataModel.fromJson(String source) =>
      LikesAndDesLikesDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [like, desLike];
}
