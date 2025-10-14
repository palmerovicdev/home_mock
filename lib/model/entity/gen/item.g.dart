// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  id: json['id'] as String,
  title: json['title'] as String,
  city: json['city'] as String,
  imageUrl: json['imageUrl'] as String,
  price: (json['price'] as num).toInt(),
  category: $enumDecode(_$CategoryEnumMap, json['category']),
  description: json['description'] as String,
  size: json['size'] as String,
  bedrooms: (json['bedrooms'] as num).toInt(),
  bathrooms: (json['bathrooms'] as num).toInt(),
  owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
  isFavorite: json['isFavorite'] as bool? ?? false,
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'city': instance.city,
  'imageUrl': instance.imageUrl,
  'price': instance.price,
  'category': _$CategoryEnumMap[instance.category]!,
  'description': instance.description,
  'isFavorite': instance.isFavorite,
  'size': instance.size,
  'bedrooms': instance.bedrooms,
  'bathrooms': instance.bathrooms,
  'owner': instance.owner.toJson(),
};

const _$CategoryEnumMap = {
  Category.apartment: 'apartment',
  Category.house: 'house',
  Category.all: 'all',
};
