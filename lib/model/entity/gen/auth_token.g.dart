// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../auth_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) => AuthToken(
  token: json['token'] as String,
  role: json['role'] as String,
  userId: json['userId'] as String,
  expiresAt: json['expiresAt'] == null ? null : DateTime.parse(json['expiresAt'] as String),
);

Map<String, dynamic> _$AuthTokenToJson(AuthToken instance) => <String, dynamic>{
  'token': instance.token,
  'role': instance.role,
  'userId': instance.userId,
  'expiresAt': instance.expiresAt?.toIso8601String(),
};
