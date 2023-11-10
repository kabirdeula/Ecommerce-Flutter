import 'package:ecommerce/models/model.product.dart';
import 'package:ecommerce/screens/product/product_item.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  final List<Product> items;

  const ProductList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ProductItem(
            item: items[index],
          );
        });
  }
}
