
/* 
this model represents the relationship between products and categories.
To establish a connection or association between products and categories.


  Use Cases:
Determining which categories a product belongs to.
Finding products within a specific category.
Building recommendation systems based on product-category relationships.

 */
class ProductCategoryModel {
  final String productId;
  final String categoryId;

  ProductCategoryModel({required this.productId, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'categoryId': categoryId,
    };
  }

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      productId: json['productId'] ?? '',
      categoryId: json['categoryId'] ?? '',
    );
  }

  
}
