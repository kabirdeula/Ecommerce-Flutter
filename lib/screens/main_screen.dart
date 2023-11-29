import 'package:flutter/material.dart';

import 'package:ecommerce/controllers/controller.product.dart';
import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/screens/screen.home.dart';
import 'package:ecommerce/widgets/custom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<Product>> products;
  late int currentPageIndex;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    products = fetchProduct();
    currentPageIndex = 0;
    screens = [HomeScreen(products: products)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildNavigationBar(currentPageIndex, setState),
      body: screens[currentPageIndex],
    );
  }
}
