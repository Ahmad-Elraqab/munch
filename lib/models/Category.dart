import 'package:munch_app/models/picture.dart';

class Category {
  String catName;
  String description;
  int displayOrder;
  int id;
  String metaDescription;
  String metaKeyword;
  String metaTitle;
  String slug;
  Picture picture;
  Category({
    this.catName,
    this.description,
    this.displayOrder,
    this.id,
    this.metaDescription,
    this.metaKeyword,
    this.metaTitle,
    this.slug,
    this.picture,
  });
  Category.fromJson(Map<String, dynamic> json)
      : this(
          catName: json['CatName'],
          description: json['Description'],
          displayOrder: json['DisplayOrder'],
          id: json['Id'],
          metaDescription: json['MetaDescription'],
          metaKeyword: json['MetaKeyword'],
          metaTitle: json['MetaTitle'],
          slug: json['Slug'],
          picture: Picture.fromJson(json['picture'] as Map<String, dynamic>),
        );
  Map<String, dynamic> toJson() => {};
}
