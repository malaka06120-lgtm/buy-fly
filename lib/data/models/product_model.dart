class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  final double rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.rate,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      image: json['image'],
      category: json['category'],
      rate: (json['rating']['rate'] as num).toDouble(),
    );
  }
}
