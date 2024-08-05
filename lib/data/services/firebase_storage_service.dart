import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/features/shop/models/banner_model.dart';
import 'package:store/features/shop/models/category_model.dart';

class CustomFirebaseStorageService extends GetxController {
  static CustomFirebaseStorageService get instance => Get.find();

  final firebaseStorage = FirebaseStorage.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



// * -------------------- Upload all banners , store their images first in the storage and then create banner document in firestore ------------------- *
  Future<void> uploadBannersWithImages(List<BannerModel> banners) async {
    for (final banner in banners) {
      // Upload image to Firebase Storage
      final imageData = await rootBundle.load(banner.imageUrl);
      final bytes = imageData.buffer.asUint8List();
      final storageRef = firebaseStorage
          .ref('banner_images/${banner.imageUrl.split('/').last}');
      final uploadTask = await storageRef.putData(bytes);
      final imageUrl = await uploadTask.ref.getDownloadURL();

      // Create banner document in Firestore
      final bannerRef = _firestore.collection('Banners').doc();
      await bannerRef.set({
        'imageUrl': imageUrl,
        'targetScreen': banner.targetScreen,
        'active': banner.active,
      });
    }
  }


  Future<void> 
 uploadCategoriesWithImages(List<CategoryModel> categories) async {
    for (final category in categories) {
      // Upload image to Firebase Storage
      final imageData = await rootBundle.load(category.image);
      final bytes = imageData.buffer.asUint8List();
      final storageRef = firebaseStorage.ref('category_images/${category.id}');
      final uploadTask = await storageRef.putData(bytes);
      final imageUrl = await uploadTask.ref.getDownloadURL();

      // Create category document in Firestore with specified ID
      final categoryRef = _firestore.collection('Categories').doc(category.id);
      await categoryRef.set({
        'name': category.name,
        'image': imageUrl,
        'isFeatured': category.isFeatured,
        'parentId': category.parentId,
      });
    }
  }







Future<void>  
 uploadBanners(List<BannerModel> banners) async {
    final batch = _firestore.batch(); // Use batch for efficient writes

    for (final banner in banners) {
      final bannerRef = _firestore.collection('Banners').doc();
      batch.set(bannerRef, banner.toJson()); // Convert model to a map
    }

    await batch.commit();
  }






// upload local assets from IDE
// returns a Uint8List containing image data
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Error loading image data: $e';
    }
  }

// Upload image using image data  on cloud firebase storage
// returns the download url of the uploaded image
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      // Handle exceptions gracefully
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else {
        throw 'Something Went Wrong! Please try again.';
      }
    }
  }




  // upload image on cloud firebase storage
  // returns the download url of the uploaded image
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      // Handle exceptions gracefully
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else {
        throw 'Something Went Wrong! Please try again.';
      }
    }
  }

  Future<List<String>> uploadImageFileListFromAssets(
      List<String> imagePaths, String storagePath) async {
    List<String> downloadUrls = [];

    for (String imagePath in imagePaths) {
      try {
        final byteData = await rootBundle.load(imagePath);
        final imageData = byteData.buffer.asUint8List();
        final downloadUrl = await uploadImageData(
            storagePath, imageData, imagePath.split('/').last);
        downloadUrls.add(downloadUrl);
      } catch (e) {
        // Handle exceptions gracefully
        print('Error uploading image: $e');
      }
    }

    return downloadUrls;
  }
 




}
