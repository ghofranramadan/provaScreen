class Branch {
  int id;
  String name;
  String phone;
  int storeId;
  DateTime createdAt;
  DateTime updatedAt;
  Address address;

  Branch({
    this.id,
    this.name,
    this.phone,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.address,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        storeId: json["store_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        address: Address.fromJson(json["address"]),
      );
}

class Address {
  int id;
  dynamic building;
  dynamic floor;
  String street;
  String landmark;
  dynamic townId;
  int cityId;
  String locationLink;
  City city;

  Address({
    this.id,
    this.building,
    this.floor,
    this.street,
    this.landmark,
    this.townId,
    this.cityId,
    this.locationLink,
    this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        building: json["building"],
        floor: json["floor"],
        street: json["street"],
        landmark: json["landmark"],
        townId: json["town_id"],
        cityId: json["city_id"],
        locationLink: json["location_link"],
        city: City.fromJson(json["city"]),
      );
}

class City {
  int id;
  Name name;
  NameEn nameEn;
  List<City> towns;
  int cityId;

  City({
    this.id,
    this.name,
    this.nameEn,
    this.towns,
    this.cityId,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: nameValues.map[json["name"]],
        nameEn: nameEnValues.map[json["name_en"]],
        towns: json["towns"] == null
            ? null
            : List<City>.from(json["towns"].map((x) => City.fromJson(x))),
        cityId: json["city_id"] == null ? null : json["city_id"],
      );
}

enum Name { EMPTY, NAME }
final nameValues = EnumValues({"القاهرة": Name.EMPTY, "القاهره": Name.NAME});
enum NameEn { CAIRO }
final nameEnValues = EnumValues({"Cairo": NameEn.CAIRO});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;
  EnumValues(this.map);
  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
