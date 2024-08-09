class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 8.0,
    this.salePrice = 0.0,
    this.stock = 8,
    required this.attributeValues,
  });

  /// Create Empty func for clean code
  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  /// Json Format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'image': image,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'stock': stock,
      'attributeValues': attributeValues,
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return ProductVariationModel.empty();

    return ProductVariationModel(
      id: data['id'] ?? '',
      sku: data['sku'] ?? '',
      image: data['image'] ?? '',
      description: data['description'] ?? '',
      stock: data['stock'],
      attributeValues: Map<String, String>.from(data['attributeValues']),
      salePrice: data['salePrice'] ?? 0.0,
      price: data['price'] ?? 0.0 ,
    );
  }
}
