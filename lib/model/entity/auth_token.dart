import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/auth_token.freezed.dart';
part 'gen/auth_token.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class AuthToken with _$AuthToken {
  AuthToken({
    required this.token,
    required this.role,
    required this.userId,
    this.expiresAt,
  });

  @override
  final String token;
  @override
  final String role;
  @override
  final String userId;
  @override
  final DateTime? expiresAt;

  factory AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);

  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  bool get isValid => token.isNotEmpty && !isExpired;
}
