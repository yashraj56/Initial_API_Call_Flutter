import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchData() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));
  if (response.statusCode == 200) {
    final parsedResponse = json.decode(response.body);
    return parsedResponse;
  } else {
    throw Exception('Failed to load data');
  }
}