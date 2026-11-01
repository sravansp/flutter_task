import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ProductRepository {
  String baseUrl = "https://dummyjson.com/products";
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      final List<dynamic> productsJson = data['products'];

      return productsJson.map((product) {
        return ProductModel.fromJson(product);
      }).toList();
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }
}
