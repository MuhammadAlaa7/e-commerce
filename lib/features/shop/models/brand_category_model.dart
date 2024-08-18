// this model represents the relationship between brands and categories.
// This suggests a many-to-many relationship between brands and categories.
// In other words, a brand can belong to multiple categories, and a category can have multiple brands.

// I made this model to get all the brands in one category


import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  final String brandId;
  final String categoryId;

  BrandCategoryModel({required this.brandId, required this.categoryId});

  Map<String, dynamic> toJson() => {
        'brandId': brandId,
        'categoryId': categoryId,
      };

  factory BrandCategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  final data = document.data()!; 
     return  BrandCategoryModel(
        brandId: data['brandId'],
        categoryId: data['categoryId'],
      );
  }
}
