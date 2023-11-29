// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:ecommerce/base/app_theme.dart';
import 'package:ecommerce/screens/home/controllers/product_controller.dart';
import 'package:ecommerce/screens/home/model/product_model.dart';
import 'package:ecommerce/screens/main_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: appBarTheme,
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
