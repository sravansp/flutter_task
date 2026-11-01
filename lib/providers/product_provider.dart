import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../repositories/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _repository = ProductRepository();

  List<ProductModel> _products = [];

  bool _isLoading = false;

  String? _errorMessage;

  List<ProductModel> get products => _products;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;

    notifyListeners();

    try {
      _products = await _repository.fetchProducts();
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;

      notifyListeners();
    }
  }
}
