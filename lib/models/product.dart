import 'package:munch_app/models/picture.dart';

class Product {
  String description;
  String displayOrder;
  int id;
  bool isCategory;
  String metaDescription;
  String metaKeyword;
  String metaTitle;
  String name;
  int oldPrice;
  double price;
  String slug;
  Picture lstPictures;
  Product({
    this.description,
    this.displayOrder,
    this.id,
    this.isCategory,
    this.metaDescription,
    this.metaKeyword,
    this.metaTitle,
    this.name,
    this.oldPrice,
    this.price,
    this.slug,
    this.lstPictures,
  });
  Product.fromJson(Map<String, dynamic> json)
      : this(
          description: json['Description'],
          displayOrder: json['DisplayOrder'],
          id: json['Id'],
          isCategory: json['IsCategory'],
          metaDescription: json['MetaDescription'],
          metaKeyword: json['MetaKeyword'],
          metaTitle: json['MetaTitle'],
          name: json['Name'],
          oldPrice: json['OldPrice'],
          price: json['Price'],
          slug: json['Slug'],
          lstPictures:
              Picture.fromJson(json['lstPictures'] as Map<String, dynamic>),
        );
  Map<String, dynamic> toJson() => {};
}
