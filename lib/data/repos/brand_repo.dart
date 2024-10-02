import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/models/brand_model.dart';
import 'package:store/core/utils/exceptions/firebase_exceptions.dart';
import 'package:store/core/utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // get featured brands from firebase
  Future<List<BrandModel>> getFeaturedBrands() async {
    try {
      final snapshot = await _db
          .collection('Brands')
          .where('isFeatured', isEqualTo: true)
          .limit(4)
          .get();
      final brands = snapshot.docs.map((queryDocumentSnapshot) {
        return BrandModel.fromSnapshot(queryDocumentSnapshot);
      }).toList();
      return brands;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again later!';
    }
  }

  // get all brands from firebase
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final brands = snapshot.docs.map((queryDocumentSnapshot) {
        return BrandModel.fromSnapshot(queryDocumentSnapshot);
      }).toList();
      return brands;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again later!';
    }
  }

//  * get brands for a category  by category id
// 1. query the documents from BrandCategory collection that match the provided category id
// 2. extract the brand ids list from the documents
// 3. get all brands from brands collection whose ids are in the brand ids list
  Future<List<BrandModel>> getBrandsByCategoryId(String categoryId) async {
    try {
      // get the all documents that match the category id from the relation between category and brand
      final documentsQuery = await _db
          .collection('BrandCategories')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      // Extract the brands ids from the documents
      List<String> brandIds =
          documentsQuery.docs.map((doc) => doc['brandId'] as String).toList();
      // get all brands from brands collection according to the brand ids list
      // get only 2 brands from the list to be in the show case
      final snapshot = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();
      final brands = snapshot.docs.map((document) {
        return BrandModel.fromSnapshot(document);
      }).toList();
      return brands;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again later!';
    }
  }
}
