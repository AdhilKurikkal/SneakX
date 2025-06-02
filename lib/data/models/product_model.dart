class ShoeModel {
  final String id;
  final String name;
  final List<String> imageUrl;
  final String imageRbg;
  final List<String> sizes;
  final List<String> colors;
  final int price;
  final String category;

  ShoeModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.imageRbg,
    required this.sizes,
    required this.colors,
    required this.price,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'imageRgb': imageRbg,
      'sizes': sizes,
      'colors': colors,
      'price': price,
      'category': category,
    };
  }

  factory ShoeModel.fromMap(Map<String, dynamic> map) {
    return ShoeModel(
      id: map['id'],
      name: map['name'],
      imageUrl: List<String>.from(map['imageUrl']),
      sizes: List<String>.from(map['sizes']),
      colors: List<String>.from(map['colors']),
      price: map['price'],
      imageRbg: map['imageRgb'],
      category: map['category'],
    );
  }
}
