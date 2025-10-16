// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  avatarUrl: json['avatarUrl'] as String? ?? '',
  isLoggedIn: json['isLoggedIn'] as bool? ?? false,
  lastLogin: json['lastLogin'] == null ? null : DateTime.parse(json['lastLogin'] as String),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'name': instance.name,
  'avatarUrl': instance.avatarUrl,
  'isLoggedIn': instance.isLoggedIn,
  'lastLogin': instance.lastLogin?.toIso8601String(),
};
