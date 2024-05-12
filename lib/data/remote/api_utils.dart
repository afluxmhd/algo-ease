import 'package:http/http.dart' as http;

http.Response processResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return response;
    case 400:
      throw Exception('Bad Request: ${response.body.toString()}');
    case 401:
    case 403:
      throw Exception('Unauthorized: ${response.body.toString()}');
    case 500:
    default:
      throw Exception('Server Error: ${response.statusCode}');
  }
}
