class Brand {
  final int id;
  final bool isActive;
  final String firebaseId;
  final int followerCount;
  final bool hasMale;
  final bool hasKid;
  final bool hasFemale;
  final String name;
  final int noSalesProva;
  final int noSalesOut;
  final int salesProva;
  final int salesOut;
  final bool isInstore;
  final bool isShipping;
  final String profilePicture;
  final int ratingAverage;
  final int noRates;
  final int noFollowers;
  final String description;
  final String adminNotes;
  final String facebook;
  final String instagram;
  final String twitter;
  final String whatsapp;
  final String snapchat;
  final String youtube;
  final String messenger;
  final String telegram;
  final String createdAt;
  final String updatedAt;
  final List<Product> products;
  final List <Branches>branches;

  Brand(
      {this.id,
      this.isActive,
      this.firebaseId,
      this.followerCount,
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
      this.branches});
}

class Product {
  final int id;
  final int categoryId;
  final int subCategoryId;
  final String description;
  final int discountPrice;
  final int buyingPrice;
  final int price;
  final int gender;
  final int noStock;
  final int noLikes;
  final String name;
  final int ratingAverage;
  final int noRates;
  final int storeId;
  final int storeBranchId;
  final int noViews;
  final bool isReadOnly;
  final List<Images> images;
  final List<Stock> stock;

  Product(
      {this.id,
      this.categoryId,
      this.subCategoryId,
      this.description,
      this.discountPrice,
      this.buyingPrice,
      this.price,
      this.gender,
      this.noStock,
      this.noLikes,
      this.name,
      this.ratingAverage,
      this.noRates,
      this.storeId,
      this.storeBranchId,
      this.noViews,
      this.isReadOnly,
      this.images,
      this.stock});
}

class Images {
  final int id;
  final String url;
  Images({this.id, this.url});
}

class Stock {
  final int id;
  final int productId;
  final String color;
  final List sizes;
  final String createdAt;
  final String updatedAt;
  Stock(
      {this.id,
      this.productId,
      this.color,
      this.sizes,
      this.createdAt,
      this.updatedAt});
}
class  Branches{} 