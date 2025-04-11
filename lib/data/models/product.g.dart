// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => _ProductItem(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  image: json['image'] as String,
  isLiked: json['isLiked'] as bool,
  price: (json['price'] as num).toDouble(),
  discount: (json['discount'] as num).toDouble(),
);

Map<String, dynamic> _$ProductItemToJson(_ProductItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'isLiked': instance.isLiked,
      'price': instance.price,
      'discount': instance.discount,
    };
