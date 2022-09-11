// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ErrorModel {
  final bool status;
  final String message;

  ErrorModel({
    required this.status,
    required this.message,
  });

  ErrorModel copyWith({
    bool? status,
    String? message,
  }) {
    return ErrorModel(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'result': message,
    };
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      status: map['status'] ?? false,
      message: map['result'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromJson(String source) =>
      ErrorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ErrorModel(status: $status, message: $message)';

  @override
  bool operator ==(covariant ErrorModel other) {
    if (identical(this, other)) return true;

    return other.status == status && other.message == message;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode;
}
