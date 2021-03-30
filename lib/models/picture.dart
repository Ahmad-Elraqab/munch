import 'package:basic_utils/basic_utils.dart';

class Picture {
  int displayOrder;
  String pictureAlt;
  String pictureName;
  String picturePath;
  String pictureTitle;

  Picture({
    this.displayOrder,
    this.pictureAlt,
    this.pictureName,
    this.picturePath,
    this.pictureTitle,
  });
  Picture.fromJson(Map<String, dynamic> json)
      : this(
          displayOrder: json["DisplayOrder"],
          pictureAlt: json["PictureAlt"],
          pictureName: json["PictureName"],
          picturePath:
              StringUtils.addCharAtPosition(json["PicturePath"], "live", 8),
          pictureTitle: json["PictureTitle"],
        );
  Map<String, dynamic> toJson() => {};
}
