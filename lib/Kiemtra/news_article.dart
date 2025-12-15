class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage:
          json['urlToImage'] ??
          "https://via.placeholder.com/150", // fallback image
      content: json['content'] ?? '',
    );
  }
}
