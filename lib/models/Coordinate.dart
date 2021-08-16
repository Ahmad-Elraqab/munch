class Coordinate {
  int id;
  List<String> latitude;
  List<String> longitude;
  Coordinate({
    this.id,
    this.latitude,
    this.longitude,
  });
  Coordinate.fromJson(Map<String, dynamic> json)
      : this(
          latitude: json['ZoneCoordinates']
              .toString()
              .split('0')
              .toList()
              .map((e) => e.split(',')[0]),
          longitude: json['ZoneCoordinates']
              .toString()
              .split('0')
              .toList()
              .map((e) => e.split(',')[1]),
        );
  Map<String, dynamic> toJson() => {};
}
