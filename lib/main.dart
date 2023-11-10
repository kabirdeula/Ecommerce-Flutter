// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:convert';

import 'package:ecommerce/models/model.product.dart';
import 'package:ecommerce/screens/screen.home.dart';
import 'package:flutter/material.dart';

import 'config/config.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Product>> products = fetchProducts();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 4.0,
          ),
          useMaterial3: true),
      home: HomeScreen(products: products, title: 'Daraz Lite'),
    );
  }

  Future<List<Product>> fetchProducts() async {
    const String apiUrl = "$baseUrl/api/products";
    try {
      await Future.delayed(const Duration(seconds: 2));

      final HttpClientRequest request =
          await HttpClient().getUrl(Uri.parse(apiUrl));
      final HttpClientResponse response = await request.close();

      if (response.statusCode == 200) {
        final List<dynamic> jsonData =
            json.decode(await response.transform(utf8.decoder).join());
        final List<Product> products =
            jsonData.map((data) => Product.fromMap(data)).toList();
        return products;
      } else {
        throw Exception(
            'Failed to fetch products. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      rethrow;
    }
  }
}
