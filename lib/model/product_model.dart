// class Product {
//   final int id;
//   final String title;
//   final String description;
//   final double price;
//   final double discountPercentage;
//   final double rating;
//   final int stock;
//   final String brand;
//   final String category;
//   final String thumbnail;
//   final List<String> images;

//   Product({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.discountPercentage,
//     required this.rating,
//     required this.stock,
//     required this.brand,
//     required this.category,
//     required this.thumbnail,
//     required this.images,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       title: json['title'],
//       description: json['description'],
//       price: json['price'].toDouble(),
//       discountPercentage: json['discountPercentage'].toDouble(),
//       rating: json['rating'].toDouble(),
//       stock: json['stock'],
//       brand: json['brand'],
//       category: json['category'],
//       thumbnail: json['thumbnail'],
//       images: List<String>.from(json['images']),
//     );
//   }
// }

class ProductList {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  ProductList({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) {
    final productsJson = json['products'] as List;
    final products = productsJson
        .map((productJson) => Product.fromJson(productJson))
        .toList();

    return ProductList(
      products: products,
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images']),
    );
  }
}
