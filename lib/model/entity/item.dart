import 'package:freezed_annotation/freezed_annotation.dart';

import 'owner.dart';

part 'gen/item.freezed.dart';
part 'gen/item.g.dart';

@freezed
@JsonSerializable()
class Item with _$Item {
  Item({
    required this.id,
    required this.title,
    required this.city,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.description,
    required this.size,
    required this.bedrooms,
    required this.bathrooms,
    required this.owner,
    @Default(false) this.isFavorite = false,
  });

  @override
  final String id, title, city, imageUrl;
  @override
  final int price;
  @override
  final Category category;
  @override
  final String description;
  @override
  final bool isFavorite;
  @override
  final String size;
  @override
  final int bedrooms;
  @override
  final int bathrooms;
  @override
  final Owner owner;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

enum Category {
  apartment,
  house,
  all,
}
