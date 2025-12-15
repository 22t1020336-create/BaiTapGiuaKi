import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:thaydungbt/Kiemtra/news_article.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticle article;
  const NewsDetailScreen({super.key, required this.article});

  void _openOriginal() async {
    final url = Uri.parse(article.url);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chi tiết bài viết")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              article.urlToImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "images/no_image.jpg",
                  fit: BoxFit.cover,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(article.description),
                  SizedBox(height: 15),
                  Text(article.content),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: _openOriginal,
                    child: Text("Đọc bài gốc"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
