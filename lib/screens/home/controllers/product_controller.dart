import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/base/utils.dart';
import 'package:http/http.dart' as http;

import 'package:ecommerce/config/config.dart';
import 'package:ecommerce/screens/home/model/product_model.dart';

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
      return Utils.log('Failed to load products');
      // throw Exception("Failed to load products");
    }
  } on SocketException catch (e) {
    return Utils.log(e.toString());
  } on http.ClientException catch (e) {
    return Utils.log(e.toString());
  } catch (error) {
    return Utils.log(error.toString());
  }
}
