import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/owner.freezed.dart';
part 'gen/owner.g.dart';

@freezed
@JsonSerializable()
class Owner with _$Owner {
  Owner({
    required this.name,
    required this.avatarUrl,
    required this.city,
  });

  @override
  final String name;
  @override
  final String avatarUrl;
  @override
  final String city;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
