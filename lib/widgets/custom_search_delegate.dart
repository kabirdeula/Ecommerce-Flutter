// ignore_for_file: avoid_print

import 'package:ecommerce/screens/home/controllers/product_controller.dart';
import 'package:ecommerce/screens/home/model/product_model.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  Future<List<Product>> products = fetchProduct();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: products,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          final productList = snapshot.data;
          if (productList == null || productList.isEmpty) {
            return const Text("No results found");
          } else {
            final matchQuery = productList
                .where((product) =>
                    product.name.toLowerCase().contains(query.toLowerCase()))
                .toList();

            return ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                var result = matchQuery[index];
                return ListTile(
                  title: Text(result
                      .name), // Assuming 'name' is a property of the Product class
                );
              },
            );
          }
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Text('Search');
    } else {
      return FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            final productList = snapshot.data;
            if (productList == null || productList.isEmpty) {
              return const Center(
                child: Text("No results found"),
              );
            } else {
              final matchQuery = productList
                  .where((product) =>
                      product.name.toLowerCase().contains(query.toLowerCase()))
                  .toList();
              return ListView.builder(
                itemCount: matchQuery.length,
                itemBuilder: (context, index) {
                  var result = matchQuery[index];
                  return ListTile(
                    title: Text(result.name),
                  );
                },
              );
            }
          }
        },
      );
    }
  }
}
