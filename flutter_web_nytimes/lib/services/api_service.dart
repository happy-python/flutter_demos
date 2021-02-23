import 'dart:convert';
import 'package:flutter_web_nytimes/models/article_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  final String _baseUrl = 'api.nytimes.com';
  final String _apiKey = '<YOUR_API_KEY>';

  Future<List<Article>> fetchArticlesBySection(String section) async {
    Map<String, String> parameters = {
      'api-key': _apiKey,
    };

    Uri uri =
        Uri.https(_baseUrl, '/svc/topstories/v2/$section.json', parameters);

    try {
      var response = await http.get(uri);
      Map<String, dynamic> data = json.decode(response.body);
      List<Article> articles = [];
      if (data != null) {
        data['results'].forEach(
          (articleMap) => articles.add(Article.fromMap(articleMap)),
        );
      }
      return articles;
    } catch (err) {
      throw err.toString();
    }
  }
}
