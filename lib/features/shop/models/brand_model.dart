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
  Map<String, dynamic> toJson({String? image}) {
    return {
      'id': id,
      'name': name,
      'image': image ?? this.image,
      'productsCount': productsCount,
      'isFeatured': isFeatured,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();

    return BrandModel(
    // the id of the ducment is the id of the brand
    id : data['id'] ?? '', 
      name: data['name']??'', 
      image: data['image'] ?? '',
      productsCount: data['productsCount'] ?? 0,
      isFeatured: data['isFeatured'] ?? false ,
    );
  }




  // from query snapshot
  factory BrandModel.fromQuerySnapshot(QueryDocumentSnapshot<Map<String, dynamic>> document) {
   // final data = document.data() as Map<String, dynamic>;

    final data = document.data(); 
        return  BrandModel(
          id: document.id, 
          name: data['name']??'', 
          image: data['image'] ?? '',
          productsCount: data['productsCount'] ?? 0,
          isFeatured: data['isFeatured'] ?? false ,
        ); 
  }
}
