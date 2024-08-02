class CartItemModel {
  final String productId;
  final String variationId;
  final int quantity;
  final String title;
  final String image;
  final String brandName;
  final double price;
  final List<dynamic> selectedVariation; // Placeholder for product variations

  CartItemModel({
    required this.productId,
    required this.variationId,
    required this.quantity,
    required this.title,
    required this.image,
    required this.brandName,
    required this.price,
    required this.selectedVariation,
  });
}
