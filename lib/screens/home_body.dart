// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/base/utils.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/data/model/product_model.dart';

import 'product/product_list.dart';

class HomeBody extends StatelessWidget {
  final Future<List<Product>> products;

  const HomeBody({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
