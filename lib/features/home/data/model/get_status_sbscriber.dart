// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class GetStatusSubscriber extends Equatable {
  final bool status;
  final bool result;
  const GetStatusSubscriber({
    required this.status,
    required this.result,
  });

  GetStatusSubscriber copyWith({
    bool? status,
    bool? result,
  }) {
    return GetStatusSubscriber(
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

  factory GetStatusSubscriber.fromMap(Map<String, dynamic> map) {
    return GetStatusSubscriber(
      status: map['status'] as bool,
      result: map['result'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetStatusSubscriber.fromJson(String source) =>
      GetStatusSubscriber.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, result];
}
