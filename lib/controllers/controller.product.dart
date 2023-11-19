import 'dart:convert';

import 'package:ecommerce/config/config.dart';
import 'package:ecommerce/models/model.product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProduct() async {
  // const String apiUrl = "$baseUrl/products";
  const String apiUrl = baseUrl + productEndpoint;
  try {
    await Future.delayed(const Duration(seconds: 2));

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      final List<Product> products =
          jsonData.map((data) => Product.fromMap(data)).toList();
      return products;
    } else {
      throw Exception("Failed to load products");
    }
  } catch (error) {
    throw Exception(error.toString());
  }
}
