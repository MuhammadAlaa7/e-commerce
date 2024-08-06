// this model represents the relationship between brands and categories.
// This suggests a many-to-many relationship between brands and categories.
// In other words, a brand can belong to multiple categories, and a category can have multiple brands.




class BrandCategoryModel {
  final String brandId;
  final String categoryId;

  BrandCategoryModel({required this.brandId, required this.categoryId});

  Map<String, dynamic> toJson() => {
        'brandId': brandId,
        'categoryId': categoryId,
      };

  factory BrandCategoryModel.fromJson(Map<String, dynamic> json) =>
      BrandCategoryModel(
        brandId: json['brandId'],
        categoryId: json['categoryId'],
      );
}
