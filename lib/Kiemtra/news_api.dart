import 'dart:convert';
import 'package:http/http.dart' as http;
import 'news_article.dart';

class NewsApiService {
  final String apiKey = "bc18f636ced641e4940bf5982dbce62b";

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data["articles"];

      return articles.map((e) => NewsArticle.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }
}
