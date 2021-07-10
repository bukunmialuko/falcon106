import 'dart:convert';

import 'package:falcon106/core/models/product.dart';
import 'package:falcon106/helpers/constants.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class API {
  static const endpoint = URL.productListURL;

  var client = new http.Client();

  Future<List<Product>> getProducts() async {
    List<Product> products = [];
    // var response = await client.get(Uri.parse('$endpoint' + 'products.json'));

    // Connecting with live server
    // var data = json.decode(response.body) as List<dynamic>;

    // :) MOCK DATA
    final String res = await rootBundle.loadString('assets/products_list.json');
    var data = await Future.delayed(
        const Duration(seconds: 5), () => json.decode(res) as List<dynamic>);

    for (var product in data) {
      products.add(Product.fromJson(product));
    }

    return products;
  }
}
