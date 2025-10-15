import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/user.freezed.dart';
part 'gen/user.g.dart';

@freezed
@JsonSerializable()
class User with _$User {
  User({
    required this.id,
    required this.email,
    required this.name,
    @Default('') this.avatarUrl = '',
    @Default(false) this.isLoggedIn = false,
    this.lastLogin,
  });

  @override
  final String id;
  @override
  final String email;
  @override
  final String name;
  @override
  final String avatarUrl;
  @override
  final bool isLoggedIn;
  @override
  final DateTime? lastLogin;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static User mock() => User(
    id: 'mock_user_1',
    email: 'user@homemock.com',
    name: 'Victor Demo',
    avatarUrl: 'https://i.pravatar.cc/200',
    isLoggedIn: true,
    lastLogin: DateTime.now(),
  );
}
