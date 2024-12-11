import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/m_product.dart';

Future<List<Products>> getProducts() async {
  final uri = Uri.parse("https://dummyjson.com/products?limit=5");
  final response = await http.get(
    uri,
    headers: {"Content-Type": "application/json"},
  );
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    return Product.fromJson(data).products;
  } else {
    throw Exception("Failed to fetch api");
  }
}