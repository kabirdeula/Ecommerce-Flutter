import 'package:ecommerce/base/utils.dart';
import 'package:ecommerce/data/model/product_model.dart';
import 'package:ecommerce/screens/product/product_list.dart';
import 'package:ecommerce/widgets/custom_search_delegate.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  final Future<List<Product>> products;

  const HomeScreen({
    super.key,
    required this.products,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Daraz Lite'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Product>>(
          future: products,
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
