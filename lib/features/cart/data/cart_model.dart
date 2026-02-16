class CartProductModel {
  final String id; 
  final String title; 
  final String image; 
  final String size; 
  final double price; 
  int quantity; 

  CartProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.size,
    required this.price,
    this.quantity = 1, 
  });
  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      size: json['size'],
      price: json['price'].toDouble(),
      quantity: json['quantity'] ?? 1,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'size': size,
      'price': price,
      'quantity': quantity,
    };
  }
}

