import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List jsonData = json.decode(response.body);
        return jsonData.map((item) => Post.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
