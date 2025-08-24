class ListCategoryModel {
  final List<Datum>? data;

  ListCategoryModel({this.data});

  factory ListCategoryModel.fromJson(Map<String, dynamic> json) =>
      ListCategoryModel(
        data:
            json["data"] == null
                ? []
                : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "data":
        data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? id;
  final String? name;
  final String? thumbnailPath;
  final List<Product>? product;

  Datum({this.id, this.name, this.thumbnailPath, this.product});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    thumbnailPath: json["thumbnail_path"],
    product:
        json["product"] == null
            ? []
            : List<Product>.from(
              json["product"]!.map((x) => Product.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "thumbnail_path": thumbnailPath,
    "product":
        product == null
            ? []
            : List<dynamic>.from(product!.map((x) => x.toJson())),
  };
}

class Product {
  final int? id;
  final int? categoryId;
  final String? name;
  final String? price;
  final String? heavy;
  final String? description;

  Product({
    this.id,
    this.categoryId,
    this.name,
    this.price,
    this.heavy,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"],
    price: json["price"],
    heavy: json["heavy"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "price": price,
    "heavy": heavy,
    "description": description,
  };
}
