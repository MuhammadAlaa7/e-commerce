import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.image,
    required this.name,
    this.isFeatured,
    this.productsCount,
  });

  /// Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  /// Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'productsCount': productsCount,
      'isFeatured': isFeatured,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      productsCount: json['productsCount'] ?? 0,
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  // from query snapshot
  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    // final data = document.data() as Map<String, dynamic>;
          if( document.data() == null) return BrandModel.empty();
    final data = document.data()!;
    return BrandModel(
      id: document.id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      productsCount: data['productsCount'] ?? 0,
      isFeatured: data['isFeatured'] ?? false,
    );
  }
}
