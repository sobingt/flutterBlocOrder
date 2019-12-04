import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

      
class MovieApiProvider {
  Client client = Client();
final String tokenValue = "";
final url = 'http://api.gullymart.tk/api/orders';
  Future<OrderResponseModel> fetchMovieList() async {
    print("entered");

  Map<String, String> headers = {
    'Content-type': 'application/json',
      'Authorization': 'Bearer $tokenValue'
  };
    final response = await client.get(url, headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return OrderResponseModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}