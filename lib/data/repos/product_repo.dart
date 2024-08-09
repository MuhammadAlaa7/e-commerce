import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/utils/exceptions/firebase_exceptions.dart';
import 'package:store/utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      // Get featured documents from the collection <products>
      final snapshot = await db
          .collection('Products')
          .where('isFeatured', isEqualTo: true)
          .limit(4)
          .get();

      final products = snapshot.docs.map((document) {
        try {
          return ProductModel.fromSnapshot(document);
        } catch (e) {
          log('Error mapping document to ProductModel: ${document.id}, Error: $e');
          // You could throw the error or return a default empty ProductModel
          throw e; // or return ProductModel.empty();
        }
      }).toList();

     
      return products;
    } on FirebaseException catch (e) {
     
      throw CustomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
     
      throw CustomPlatformException(e.code).message;
    } catch (e) {
     
      throw 'Something went wrong, please try again later!';
    }
  }
}
