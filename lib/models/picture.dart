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
          picturePath: json["PicturePath"],
          pictureTitle: json["PictureTitle"],
        );
  Map<String, dynamic> toJson() => {};
}
