
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/core/utils/exceptions/firebase_exceptions.dart';
import 'package:store/core/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // variables
  final _db = FirebaseFirestore.instance;

  /// get all categories

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      // get all the documents from the collection < categories >
      final snapshot = await _db.collection('Categories').get();
      // map through the documents and convert them to a list of categories model
      final categories = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return categories;
      
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , please try again later!';
    }
  }

  /// get sub categories

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      // get all the documents from the collection < categories >
      final snapshot = await _db
          .collection('Categories')
          .where('parentId', isEqualTo: categoryId)
          .get();
      // map through the documents and convert them to a list of categories model
      final categories = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return categories;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , please try again later!';
    }
  }



}

