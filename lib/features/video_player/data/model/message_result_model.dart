// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MessageResultModel extends Equatable {
  final bool status;
  final String result;

  const MessageResultModel({
    required this.status,
    required this.result,
  });

  MessageResultModel copyWith({
    bool? status,
    String? result,
  }) {
    return MessageResultModel(
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

  factory MessageResultModel.fromMap(Map<String, dynamic> map) {
    return MessageResultModel(
      status: map['status'] as bool,
      result: map['result'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageResultModel.fromJson(String source) =>
      MessageResultModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, result];
}
