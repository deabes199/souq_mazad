import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';
@JsonSerializable()
class ProductModel {
  final List<Products> products;

  ProductModel(this.products);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>_$ProductModelFromJson(json);
  
}
@JsonSerializable()
class Products {
  final int? id;
  final String? title;
  final String? description;
  final String? thumbnail;
  final double? price;

  Products(this.id, this.title, this.description, this.thumbnail, this.price);

  factory Products.fromJson(Map<String, dynamic> json) =>_$ProductsFromJson(json);

}
