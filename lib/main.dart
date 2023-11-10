// ignore_for_file: avoid_print

import 'package:ecommerce/controllers/controller.product.dart';
import 'package:ecommerce/models/model.product.dart';
import 'package:ecommerce/screens/screen.home.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Product>> products = fetchProduct();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 4.0,
        ),
        useMaterial3: true,
      ),
      home: HomeScreen(
        products: products,
        title: 'Daraz Lite',
      ),
    );
  }
}
