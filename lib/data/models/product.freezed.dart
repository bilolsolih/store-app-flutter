// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductItem {

 int get id; String get title; String get image; bool get isLiked; double get price; double get discount;
/// Create a copy of ProductItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductItemCopyWith<ProductItem> get copyWith => _$ProductItemCopyWithImpl<ProductItem>(this as ProductItem, _$identity);

  /// Serializes this ProductItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.price, price) || other.price == price)&&(identical(other.discount, discount) || other.discount == discount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,image,isLiked,price,discount);

@override
String toString() {
  return 'ProductItem(id: $id, title: $title, image: $image, isLiked: $isLiked, price: $price, discount: $discount)';
}


}

/// @nodoc
abstract mixin class $ProductItemCopyWith<$Res>  {
  factory $ProductItemCopyWith(ProductItem value, $Res Function(ProductItem) _then) = _$ProductItemCopyWithImpl;
@useResult
$Res call({
 int id, String title, String image, bool isLiked, double price, double discount
});




}
/// @nodoc
class _$ProductItemCopyWithImpl<$Res>
    implements $ProductItemCopyWith<$Res> {
  _$ProductItemCopyWithImpl(this._self, this._then);

  final ProductItem _self;
  final $Res Function(ProductItem) _then;

/// Create a copy of ProductItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? image = null,Object? isLiked = null,Object? price = null,Object? discount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProductItem implements ProductItem {
  const _ProductItem({required this.id, required this.title, required this.image, required this.isLiked, required this.price, required this.discount});
  factory _ProductItem.fromJson(Map<String, dynamic> json) => _$ProductItemFromJson(json);

@override final  int id;
@override final  String title;
@override final  String image;
@override final  bool isLiked;
@override final  double price;
@override final  double discount;

/// Create a copy of ProductItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductItemCopyWith<_ProductItem> get copyWith => __$ProductItemCopyWithImpl<_ProductItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image)&&(identical(other.isLiked, isLiked) || other.isLiked == isLiked)&&(identical(other.price, price) || other.price == price)&&(identical(other.discount, discount) || other.discount == discount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,image,isLiked,price,discount);

@override
String toString() {
  return 'ProductItem(id: $id, title: $title, image: $image, isLiked: $isLiked, price: $price, discount: $discount)';
}


}

/// @nodoc
abstract mixin class _$ProductItemCopyWith<$Res> implements $ProductItemCopyWith<$Res> {
  factory _$ProductItemCopyWith(_ProductItem value, $Res Function(_ProductItem) _then) = __$ProductItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String image, bool isLiked, double price, double discount
});




}
/// @nodoc
class __$ProductItemCopyWithImpl<$Res>
    implements _$ProductItemCopyWith<$Res> {
  __$ProductItemCopyWithImpl(this._self, this._then);

  final _ProductItem _self;
  final $Res Function(_ProductItem) _then;

/// Create a copy of ProductItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? image = null,Object? isLiked = null,Object? price = null,Object? discount = null,}) {
  return _then(_ProductItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,isLiked: null == isLiked ? _self.isLiked : isLiked // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
