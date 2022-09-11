// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final bool status;
  final String result;

  const RegisterModel({
    required this.status,
    required this.result,
  });

  RegisterModel copyWith({
    bool? status,
    String? result,
  }) {
    return RegisterModel(
      status: status ?? this.status,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'result': result,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      status: map['status'] ?? false,
      result: map['result'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, result];
}
