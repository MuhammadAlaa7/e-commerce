import 'package:cloud_firestore/cloud_firestore.dart';

import 'brand_model.dart';
import 'product_attributes_model.dart';
import 'product_variation_model.dart';

class ProductModel {
   String id;
   int stock;
   String? sku;
   double price;
   String title;
   DateTime? date;
  double salePrice;
   String thumbnail;
  bool? isFeatured;
   BrandModel brand;
   String? description;
   String? categoryId;
   List<String>? images;
   String productType;
   List<ProductAttributeModel>? productAttributes;
   List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail, 
   required this.brand,

    required this.productType,
    this.sku,
    this.date,
    this.images,
    this.salePrice = 0,
    this.isFeatured = false,
    this.description,
    this.categoryId,
    this.productAttributes,
    this.productVariations,
  });

// empty model
  static ProductModel empty() {
    return ProductModel(
      id: '',
      title: '',
      stock: 0,
      price: 0,
      thumbnail: '',
      productType: '',
      brand: BrandModel.empty(),
      date: DateTime.now(),
      salePrice: 0,
      isFeatured: false,
      description: '',
      categoryId: '',
      images: [],
      productAttributes: [],
      productVariations: [],
    );
  }
// to json 
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'stock': stock,
      'price': price,
      'thumbnail': thumbnail,
      'productType': productType,
      'sku': sku,
      'brand': brand?.toJson(),
      'date': date,
      'salePrice': salePrice,
      'isFeatured': isFeatured,
      'description': description,
      'categoryId': categoryId,
      'images': images,
      'productAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'productVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
    };
  }

// map json oriented document snapshot from firebase to model 
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
        final data = document.data()!;
    return ProductModel(
      id: document.id,
      title: data['title'],
      stock: data['stock'] ?? 0,
      price: double.parse(data['price'] ?? 0.0 .toString() ) , 
      salePrice: double.parse(data['salePrice'] ?? 0.0 .toString() ) ,
      thumbnail: data['thumbnail'] ?? '',
      productType: data['productType'] ?? '',
      sku: data['sku'] ,
      brand:  BrandModel.fromJson(data['brand']) ,
      date: data['date'],
      isFeatured: data['isFeatured'] ?? false,
      description: data['description'] ?? '',
      categoryId: data['categoryId'] ?? '', 
      images: data['images'] != null ? List<String>.from(data['images']) : [],
      productAttributes: (data['productAttributes'] as List<dynamic>?)?.map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['productVariations'] as List<dynamic>?)?.map((e) => ProductVariationModel.fromJson(e)).toList(),

    );
  }
}