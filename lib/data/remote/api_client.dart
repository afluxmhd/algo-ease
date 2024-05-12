import 'dart:convert';
import 'package:algo_ease/data/remote/api_utils.dart';
import 'package:http/http.dart' as http;

class APIClient {
  Map<String, String>? headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<http.Response> getData(String url) async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      return processResponse(response);
    } catch (e) {
      throw Exception('Failed to perform GET request: $e');
    }
  }

  Future<http.Response> postData(String url, {required Map<String, dynamic> body}) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: headers,
      );
      return processResponse(response);
    } catch (e) {
      throw Exception('Failed to perform POST request: $e');
    }
  }
}
