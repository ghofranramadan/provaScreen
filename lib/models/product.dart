class Product {
  int id;
  int categoryId;
  int subCategoryId;
  String description;
  int discountPrice;
  int buyingPrice;
  int price;
  int gender;
  int noStock;
  int noLikes;
  String name;
  int ratingAverage;
  int noRates;
  int storeId;
  dynamic storeBranchId;
  int noViews;
  bool isReadOnly;
  List<Image> images;
  List<Stock> stock;

  Product({
    this.id,
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
    this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        description: json["description"],
        discountPrice: json["discount_price"],
        buyingPrice: json["buying_price"],
        price: json["price"],
        gender: json["gender"],
        noStock: json["no_stock"],
        noLikes: json["no_likes"],
        name: json["name"],
        ratingAverage: json["rating_average"],
        noRates: json["no_rates"],
        storeId: json["store_id"],
        storeBranchId: json["store_branch_id"],
        noViews: json["no_views"],
        isReadOnly: json["is_read_only"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        stock: List<Stock>.from(json["stock"].map((x) => Stock.fromJson(x))),
      );
}

class Image {
  int id;
  String url;
  Image({
    this.id,
    this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        url: json["url"],
      );
}

class Stock {
  int id;
  int productId;
  String color;
  dynamic sizes;
  DateTime createdAt;
  DateTime updatedAt;

  Stock({
    this.id,
    this.productId,
    this.color,
    this.sizes,
    this.createdAt,
    this.updatedAt,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        id: json["id"],
        productId: json["product_id"],
        color: json["color"],
        sizes: json["sizes"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
