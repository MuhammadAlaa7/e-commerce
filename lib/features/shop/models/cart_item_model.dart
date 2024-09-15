class CartItemModel {
  String productId;
  String variationId;
  int quantity;
  String title;
  String? image;
  String? brandName;
  double price;
  Map<String, String>? selectedVariation; // Placeholder for product variations

  CartItemModel({
    required this.productId,
    required this.quantity,
    this.variationId = '',
    this.title = '',
    this.image,
    this.brandName,
    this.price = 0.0,
    this.selectedVariation,
  });

// Empty model
  static CartItemModel empty() {
    return CartItemModel(
      productId: '',
      quantity: 0,
    );
  }

  // Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'variationId': variationId,
      'quantity': quantity,
      'title': title,
      'image': image,
      'brandName': brandName,
      'price': price,
      'selectedVariation': selectedVariation,
    };
  }

  // Convert Json structure to model to load the data from hive  [ Map<dynamic, dynamic > form ]
  static CartItemModel fromJson(Map<dynamic, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      variationId: json['variationId'],
      quantity: json['quantity'],
      title: json['title'],
      image: json['image'],
      brandName: json['brandName'],
      price: json['price']?.toDouble(),
      selectedVariation: json['selectedVariation'] != null
          ? Map<String, String>.from(json['selectedVariation'])
          : null,
    );
  }
}
