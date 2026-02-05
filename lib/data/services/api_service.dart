import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  Future<List<dynamic>> getProducts() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Server error");
    }
  }
}
