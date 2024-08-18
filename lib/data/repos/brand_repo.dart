import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/models/brand_model.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/utils/exceptions/firebase_exceptions.dart';
import 'package:store/utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController{
   static BrandRepository get instance => Get.find(); 

final _db =  FirebaseFirestore.instance ; 

   // get featured brands from firebase
   Future<List<BrandModel>> getFeaturedBrands() async {
    try {

            final snapshot = await _db.collection('Brands').where('isFeatured', isEqualTo: true).limit(4).get();
            final brands = snapshot.docs.map((queryDocumentSnapshot) {
              return BrandModel.fromQuerySnapshot(queryDocumentSnapshot);
            }).toList();
            return brands ; 

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
              return BrandModel.fromQuerySnapshot(queryDocumentSnapshot);
            }).toList();
            return brands ; 

    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again later!';
    }
}



   }