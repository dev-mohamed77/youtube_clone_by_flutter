// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class VideoWithMessage extends Equatable {
  final bool status;
  final String result;
  const VideoWithMessage({
    required this.status,
    required this.result,
  });

  @override
  List<Object> get props => [status, result];

  VideoWithMessage copyWith({
    bool? status,
    String? result,
  }) {
    return VideoWithMessage(
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

  factory VideoWithMessage.fromMap(Map<String, dynamic> map) {
    return VideoWithMessage(
      status: map['status'] as bool,
      result: map['result'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoWithMessage.fromJson(String source) =>
      VideoWithMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
