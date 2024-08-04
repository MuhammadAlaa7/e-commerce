import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/models/banner_model.dart';
import 'package:store/utils/exceptions/firebase_exceptions.dart';
import 'package:store/utils/exceptions/format_exceptions.dart';
import 'package:store/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController{

  static  BannerRepository get instance => Get.find();


// firestore instance
    final _db = FirebaseFirestore.instance ; 


    // Get all banners for current user
    Future<List<BannerModel>> getAllBanners() async {

      try {

        // get all the documents from the collection < banners >
        final snapshot = await _db.collection('banners').where('active' , isEqualTo: true).get();
        // map through the documents and convert them to a list of banners model
        final banners = snapshot.docs
            .map((document) => BannerModel.fromJson(document))
            .toList();
        return banners;



      } 
     on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , please try again later!';
    }
      
      
      
    
    }


}