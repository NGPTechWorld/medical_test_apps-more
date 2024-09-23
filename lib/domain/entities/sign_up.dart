// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpEntity {
  String message;
  String data;
  SignUpEntity({
    required this.message,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'message': message,
      'data': data,
    };
  }

  factory SignUpEntity.fromJson(Map<String, dynamic> map) {
    return SignUpEntity(
      message: map['message'] as String,
      data: map['data'] as String,
    );
  }
}
