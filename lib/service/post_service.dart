import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http_project/model/post.dart';
import 'package:http_project/service/endpoint.dart';
import 'package:http/http.dart' as http;

class PostService {
  static Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse(postsUrl),
    );

    try {
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<Post> posts =
            data.map((post) => Post.fromJson(post)).toList();
        return posts;
      }
    } catch (e) {
      throw Exception('Failed to load posts');
    } finally {
      if (kDebugMode) {
        print('fetchPosts() executed');
      }
    }

    return [];
  }

  static Future<Post> fetchPost(int id) async {
    final response = await http.get(
      Uri.parse('$postsUrl/$id'),
    );

    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final Post post = Post.fromJson(data);
        return post;
      }
    } catch (e) {
      throw Exception('Failed to load post');
    } finally {
      if (kDebugMode) {
        print('fetchPost() executed');
      }
    }

    return Post(
      userId: 0,
      id: 0,
      title: '',
      body: '',
    );
  }
}
