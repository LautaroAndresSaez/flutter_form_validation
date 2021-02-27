import 'dart:convert';

import 'package:form_validation/src/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsProvider {
  final String _url =
      'https://flutter-varios-64f10-default-rtdb.firebaseio.com';
  final String _products = 'products';

  String _buildUrl({String id}) {
    if (id == null) {
      return '$_url/$_products.json';
    }
    return '$_url/$_products/$id.json';
  }

  Future<bool> createProduct(ProductModel product) async {
    final url = _buildUrl();
    final response = await http.post(url, body: productModelToJson(product));
    return response.statusCode == 200;
  }

  Future<List<ProductModel>> loadProducts() async {
    final url = _buildUrl();
    final response = await http.get(url);
    final Map<String, dynamic> decodeData = json.decode(response.body);
    if (decodeData == null) return [];

    final List<ProductModel> products = [];
    decodeData.forEach((id, jsonProduct) {
      jsonProduct['id'] = id;
      products.add(ProductModel.fromJson(jsonProduct));
    });
    return products;
  }

  Future<bool> deleteProduct(String id) async {
    final url = '$_url/$_products/$id.json';
    final response = await http.delete(url);
    return response.statusCode == 200;
  }

  Future<bool> updateProduct(ProductModel product) async {
    final url = _buildUrl(id: product.id);
    final response = await http.put(url, body: productModelToJson(product));
    return response.statusCode == 200;
  }
}
