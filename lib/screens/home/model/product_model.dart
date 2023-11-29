import 'dart:convert';

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final int stock;

  /// Throws an [AssertionError] if the [price] or [stock] is negative.
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
  }) : assert(price >= 0 && stock >= 0);

  /// Converts the product information to a map for serialization.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'stock': stock,
    };
  }

  /// Creates a [Product] instance from a map.
  ///
  /// Throws an [ArgumentError] if the [price] or [stock] is negative.
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      price: double.parse(map['price'].toString()),
      stock: map['stock'] as int,
    )..validate();
  }

  /// Validates that the price and stock are non-negative.
  ///
  /// Throws an [ArgumentError] if the [price] or [stock] is negative.
  void validate() {
    if (price < 0 || stock < 0) {
      throw ArgumentError('Price and stock must be non-negative');
    }
  }

  /// Converts the product information to a JSON-formatted string.
  String toJson() => json.encode(toMap());

  /// Creates a [Product] instance from a JSON-formatted string.
  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
