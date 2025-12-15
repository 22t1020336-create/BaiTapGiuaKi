class Rating {
  dynamic rate;
  int count;

  Rating({
    required this.rate, 
    required this.count
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'] ?? 0,
      count: json['count'] ?? 0,
    );
  }
}

class Product {
  int id;
  String title;
  dynamic price;
  String description;
  String image;
  String category;
  Rating rating;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.rating,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      rating: Rating.fromJson(json['rating'] ?? {}),
    );
  }
}