import 'dart:convert';
import 'package:blog/models/blog_model.dart';
import 'package:http/http.dart' as http;

class BlogService {
  static const String _url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  static const String _adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  Future<List<Blog>> fetchBlogs() async {
    final response = await http.get(
      Uri.parse(_url),
      headers: {'x-hasura-admin-secret': _adminSecret},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['blogs'];
      return data.map((blog) => Blog.fromJson(blog)).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }
}
