// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ResultAndMessageModel extends Equatable {
  final bool status;
  final bool result;
  final String message;
  const ResultAndMessageModel({
    required this.status,
    required this.result,
    required this.message,
  });

  ResultAndMessageModel copyWith({
    bool? status,
    bool? result,
    String? message,
  }) {
    return ResultAndMessageModel(
      status: status ?? this.status,
      result: result ?? this.result,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'result': result,
      'message': message,
    };
  }

  factory ResultAndMessageModel.fromMap(Map<String, dynamic> map) {
    return ResultAndMessageModel(
      status: map['status'] as bool,
      result: map['result'] as bool,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultAndMessageModel.fromJson(String source) =>
      ResultAndMessageModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, result, message];
}
