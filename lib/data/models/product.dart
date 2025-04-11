import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';


@freezed
abstract class ProductItem with _$ProductItem {
  const factory ProductItem({
    required int id,
    required String title,
    required String image,
    required bool isLiked,
    required double price,
    required double discount,
  }) =_ProductItem;


  factory ProductItem.fromJson(Map<String, Object?> json) => _$ProductItemFromJson(json);
}
