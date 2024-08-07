import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/features/shop/models/banner_model.dart';
import 'package:store/features/shop/models/brand_model.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/features/shop/models/product_category_model.dart';

import '../../features/shop/models/brand_category_model.dart';
import '../../features/shop/models/product_model.dart';

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

// * -------------------- Upload all brands , store their images first in the storage and then create banner document in firestore ------------------- *

  Future<void> uploadBrandsWithImages(List<BrandModel> brands) async {
    for (final brand in brands) {
      
      // Upload image to Firebase Storage
      final imageData = await rootBundle.load(brand.image);
      final bytes = imageData.buffer.asUint8List();
      final storageRef = firebaseStorage.ref('brand_images/${brand.id}');
      final uploadTask = await storageRef.putData(bytes);
      final imageUrl = await uploadTask.ref.getDownloadURL();

      // Create brand document in Firestore
      final brandRef = _firestore.collection('Brands').doc(brand.id);
      await brandRef.set({
        'name': brand.name,
        'image': imageUrl,
        'productsCount': brand.productsCount,
        'isFeatured': brand.isFeatured,
      });
    }
  }

// * -------------------- Upload all brand category models relationship , store their images first in the storage and then create banner document in firestore ------------------- *
 Future<void> 
 uploadBrandCategories(List<BrandCategoryModel> brandCategories) async {
    final batch = _firestore.batch();

    for (final brandCategory in brandCategories) {
      final brandCategoryRef = _firestore.collection('BrandCategories').doc();
      batch.set(brandCategoryRef, brandCategory.toJson());
    }

    await batch.commit();
  }

// * -------------------- Upload all brand product category models relationship , store their images first in the storage and then create banner document in firestore ------------------- *
 Future<void> 
 uploadProductCategories(List<ProductCategoryModel> productCategories) async {
    final batch = _firestore.batch();

    for (final productCategory in productCategories) {
      final productCategoryRef = _firestore.collection('ProductCategories').doc();
      batch.set(productCategoryRef, productCategory.toJson());
    }

    await batch.commit();
  }



/// * upload products with their images to firebase 

//   Future<void> 
//  uploadProductsWithTheirImages(List<ProductModel> products) async {
//     for (final product in products) {
//       // Upload product images to Firebase Storage
//       List<String> imageUrls = [];

//         final imageData = await rootBundle.load(product.thumbnail);
//         final bytes = imageData.buffer.asUint8List();
//         final storageRef = firebaseStorage.ref('product_images/${product.id}/${product.thumbnail.split('/').last}');
//         final uploadTask = await storageRef.putData(bytes);
//         final imageUrl = await uploadTask.ref.getDownloadURL();
//         imageUrls.add(imageUrl);
      

//       // Create product document in Firestore
//       final productRef = _firestore.collection('Products').doc(product.id);
//       await productRef.set({
//         'title': product.title,
//         'stock': product.stock,
//         'price': product.price,
//         'isFeatured': product.isFeatured,
//         'thumbnail': imageUrls.first, // Assuming the first image as thumbnail
//         'description': product.description,
//         'brand': product.brand.toJson(), // Assuming BrandModel has a toJson() method
//         'images': imageUrls,
//         'salePrice': product.salePrice,
//         'sku': product.sku,
//         'categoryId': product.categoryId,
//         'productAttributes': product.productAttributes,
//         'productVariations': product.productVariations?.map((variation) => variation.toJson()).toList(), // Assuming ProductVariationModel has a toJson() method
//         'productType': product.productType,
//       });
//     }
//   }


  Future<void> 
 uploadProductsWithImages(List<ProductModel> products) async {
    for (final product in products) {
      log('Uploading product: ${product.id}');
      // Create product document in Firestore (without images)
      final productRef = _firestore.collection('Products').doc(product.id);

      // Upload product images to Firebase Storage and update Firestore
      List<String> imageUrls = [];
      for (final imagePath in product.images!) {
        final imageData = await rootBundle.load(imagePath);
        final bytes = imageData.buffer.asUint8List();
        final storageRef = firebaseStorage.ref('product_images/${product.id}/${imagePath.split('/').last}');
        final uploadTask = await storageRef.putData(bytes);
        final imageUrl = await uploadTask.ref.getDownloadURL();
        imageUrls.add(imageUrl);
      }

      // Update product data in Firestore
      await productRef.set({
        'title': product.title,
        'stock': product.stock,
        'price': product.price,
        'isFeatured': product.isFeatured,
        'description': product.description,
        'brand': product.brand.toJson(), // Assuming BrandModel has a toJson() method
        'images': imageUrls,
        'salePrice': product.salePrice,
        'sku': product.sku,
        'categoryId': product.categoryId,
        'productAttributes': product.productAttributes?.map((attribute) => attribute.toJson()).toList() ?? [],
        'productVariations': product.productVariations?.map((variation) => variation.toJson()).toList() ?? [], // Assuming ProductVariationModel has a toJson() method
        'productType': product.productType,
        'thumbnail': imageUrls.first, // Assuming the first image as thumbnail
        'brandId': product.brand.id,
        'date': product.date,
        
      });
    }
  }

  
  Future<void> uploadCategoriesWithImages(
      List<CategoryModel> categories) async {
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

  Future<void> uploadBanners(List<BannerModel> banners) async {
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
