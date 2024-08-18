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

// * Get featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      // Get featured documents from the collection <products>
      final snapshot = await db
          .collection('MyProducts')
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

// * Get products by query
  Future<List<ProductModel>> getProductByQuery(Query? query) async {
    try {
      if (query == null) {
        return [];
      }
      // Get featured documents from the collection <products>
      final querySnapshot = await query.get();

      final products = querySnapshot.docs.map((queryDocumentSnapshot) {
        try {
          return ProductModel.fromQuerySnapshot(queryDocumentSnapshot);
        } catch (e) {
          log('Error mapping document to ProductModel: ${queryDocumentSnapshot.id}, Error: $e');
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

//* get brand specific products by brand id
  Future<List<ProductModel>> getBrandProductsById(String brandId) async {
    try {
      final snapshot = await db
          .collection('MyProducts')
          .where('brandId', isEqualTo: brandId)
          .get();
      try {
        final products = snapshot.docs.map((document) {
          return ProductModel.fromSnapshot(document);
        }).toList();

        return products;
      } catch (e) {
        rethrow;
      }
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again later!';
    }
  }

// * get products by category id
  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = 4}) async {
    try {
      // limit -1 means there is no limit , so get all the products
      final snapshot = limit == -1
          ? await db
              .collection('MyProducts')
              .where('categoryId', isEqualTo: categoryId)
              .get()
          : await db
              .collection('MyProducts')
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      final products = snapshot.docs
          .map((document) => ProductModel.fromSnapshot(document))
          .toList();
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
