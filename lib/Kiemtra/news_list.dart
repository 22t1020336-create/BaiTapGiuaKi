import 'package:flutter/material.dart';
import 'package:thaydungbt/Kiemtra/news_detail.dart';
import 'package:thaydungbt/Kiemtra/news_article.dart';
import 'package:thaydungbt/Kiemtra/news_api.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final NewsApiService api = NewsApiService();
  late Future<List<NewsArticle>> articles;

  @override
  void initState() {
    super.initState();
    articles = api.fetchTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tin tức mới nhất")),
      body: FutureBuilder<List<NewsArticle>>(
        future: articles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) return Center(child: Text("Không có dữ liệu"));

          final news = snapshot.data!;

          return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              final item = news[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NewsDetailScreen(article: item),
                  ),
                ),
                child: Card(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.network(
                        item.urlToImage,
                        width: 120,
                        height: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            "images/no_image.jpg",
                            width: 120,
                            height: 90,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                item.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
