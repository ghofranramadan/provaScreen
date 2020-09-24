import 'dart:convert';
import 'package:prova/models/product.dart';
import 'package:prova/models/branches_of_brand.dart';

List<Brand> brandFromJson(String str) =>
    List<Brand>.from(json.decode(str).map((x) => Brand.fromJson(x)));

class Brand {
  int id;
  bool isActive;
  String firebaseId;
  int followersCount;
  bool hasMale;
  bool hasKid;
  bool hasFemale;
  String name;
  int noSalesProva;
  int noSalesOut;
  int salesProva;
  int salesOut;
  bool isInstore;
  bool isShipping;
  String profilePicture;
  int ratingAverage;
  int noRates;
  int noFollowers;
  String description;
  AdminNotes adminNotes;
  String facebook;
  dynamic instagram;
  dynamic twitter;
  String whatsapp;
  dynamic snapchat;
  dynamic youtube;
  String messenger;
  dynamic telegram;
  DateTime createdAt;
  DateTime updatedAt;
  List<Product> products;
  List<Branch> branches;

  Brand({
    this.id,
    this.isActive,
    this.firebaseId,
    this.followersCount,
    this.hasMale,
    this.hasKid,
    this.hasFemale,
    this.name,
    this.noSalesProva,
    this.noSalesOut,
    this.salesProva,
    this.salesOut,
    this.isInstore,
    this.isShipping,
    this.profilePicture,
    this.ratingAverage,
    this.noRates,
    this.noFollowers,
    this.description,
    this.adminNotes,
    this.facebook,
    this.instagram,
    this.twitter,
    this.whatsapp,
    this.snapchat,
    this.youtube,
    this.messenger,
    this.telegram,
    this.createdAt,
    this.updatedAt,
    this.products,
    this.branches,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        isActive: json["is_active"],
        firebaseId: json["firebase_id"],
        followersCount: json["followers_count"],
        hasMale: json["has_male"],
        hasKid: json["has_kid"],
        hasFemale: json["has_female"],
        name: json["name"],
        noSalesProva: json["no_sales_prova"],
        noSalesOut: json["no_sales_out"],
        salesProva: json["sales_prova"],
        salesOut: json["sales_out"],
        isInstore: json["is_instore"],
        isShipping: json["is_shipping"],
        profilePicture: json["profile_picture"],
        ratingAverage: json["rating_average"],
        noRates: json["no_rates"],
        noFollowers: json["no_followers"],
        description: json["description"],
        adminNotes: adminNotesValues.map[json["admin_notes"]],
        facebook: json["facebook"] == null ? null : json["facebook"],
        instagram: json["instagram"],
        twitter: json["twitter"],
        whatsapp: json["whatsapp"] == null ? null : json["whatsapp"],
        snapchat: json["snapchat"],
        youtube: json["youtube"],
        messenger: json["messenger"] == null ? null : json["messenger"],
        telegram: json["telegram"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        branches:
            List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
      );
}

enum AdminNotes {
  MERGED_FROM_FIREBASE_AT_20200701204434,
  MERGED_FROM_FIREBASE_AT_20200701204435
}
final adminNotesValues = EnumValues({
  "Merged From Firebase at: 2020-07-01 20:44:34":
      AdminNotes.MERGED_FROM_FIREBASE_AT_20200701204434,
  "Merged From Firebase at: 2020-07-01 20:44:35":
      AdminNotes.MERGED_FROM_FIREBASE_AT_20200701204435
});

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
