import 'package:munch_app/models/picture.dart';

class Product {
  String description;
  int displayOrder;
  int id;
  bool isCategory;
  String metaDescription;
  String metaKeyword;
  String metaTitle;
  String name;
  double oldPrice;
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
          oldPrice: json['OldPrice'].toDouble(),
          price: json['Price'].toDouble(),
          slug: json['Slug'],
          lstPictures: json['lstPictures'].length == 0
              ? null
              : Picture.fromJson(
                  json['lstPictures'][0] as Map<String, dynamic>,
                ),
        );
  Map<String, dynamic> toJson() => {};
}
