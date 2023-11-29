import 'package:flutter/material.dart';

import 'package:ecommerce/base/strings.dart';
import 'package:ecommerce/base/utils.dart';
import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/widgets/custom_app_bar.dart';

import 'product/product_list.dart';

class HomeScreen extends StatefulWidget {
  final Future<List<Product>> products;

  const HomeScreen({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Strings.appTitle,
      ),
      body: Center(
        child: FutureBuilder<List<Product>>(
          // future: products,
          future: widget.products,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Utils.log(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return ProductList(items: snapshot.data!);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
