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
      // Upload image to Firebase

      // * Load the image data from the assets
      final imageData = await rootBundle.load(banner.imageUrl);
      //* Convert the loaded image data into a byte array (Uint8List) for uploading
      // * because this is the format that Firebase Storage expects for storing images
      final bytes = imageData.buffer.asUint8List();
      //* Create a reference to Firebase Storage, specifying the path where the image will be stored
      //* The image is stored in the 'banner_images' folder with its original filename
      final storageRef = firebaseStorage
          .ref('banner_images/${banner.imageUrl.split('/').last}');
      // Upload the image bytes to the reference in Firebase Storage
      final uploadTask = await storageRef.putData(bytes);
      //Once the upload is complete, retrieve the download URL for the uploaded image
      final imageUrl = await uploadTask.ref.getDownloadURL();

      // Create banner document in Firestore database
      final bannerRef = _firestore.collection('Banners').doc();
      // add a new document with the banner data in the collection
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

// * ------------ Upload all brand category models relationship , without images to be added in storage  ------------------- *
// ? this is used when you want to make a collection of a list at once time
  Future<void> uploadBrandCategories(
      List<BrandCategoryModel> brandCategories) async {
    final batch = _firestore.batch();

    for (final brandCategory in brandCategories) {
      final brandCategoryRef = _firestore.collection('BrandCategories').doc();
      batch.set(brandCategoryRef, brandCategory.toJson());
    }

    await batch.commit();
  }

// * -------------------- Upload all brand product category models relationship , store their images first in the storage and then create banner document in firestore ------------------- *
  Future<void> uploadProductCategories(
      List<ProductCategoryModel> productCategories) async {
    final batch = _firestore.batch();

    for (final productCategory in productCategories) {
      final productCategoryRef =
          _firestore.collection('ProductCategories').doc();
      batch.set(productCategoryRef, productCategory.toJson());
    }

    await batch.commit();
  }

  Future<void> removeFieldFromProducts(List<ProductModel> products) async {
    for (final product in products) {
      try {
        await _firestore.collection('Products').doc(product.id).update({
          'single': FieldValue.delete(),
        });
        print('Field removed from product ${product.id} successfully');
      } catch (e) {
        print('Error removing field from product ${product.id}: $e');
      }
    }
  }

// * update products fields in firebase

  Future<void> updateProducts(
    List<ProductModel> products,
  ) async {
    for (final product in products) {
      try {
        await _firestore.collection('Products').doc(product.id).update({
          'productType': product.productType,
        });
        print('Product ${product.id} updated successfully');
      } catch (e) {
        print('Error updating product ${product.id}: $e');
      }
    }
  }

// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  Future<void> uploadProductsWithImages(List<ProductModel> products) async {
    for (final product in products) {
      log('Uploading product: ${product.id}');
      // Create product document in Firestore (without images)
      final productRef = _firestore.collection('MyProducts').doc(product.id);

      // Upload product images to Firebase Storage and update Firestore
      List<String> imageUrls = [];
      for (final imagePath in product.images!) {
        final imageData = await rootBundle.load(imagePath);
        final bytes = imageData.buffer.asUint8List();
        final storageRef = firebaseStorage
            .ref('my_products/${product.id}/${imagePath.split('/').last}');
        final uploadTask = await storageRef.putData(bytes);
        final imageUrl = await uploadTask.ref.getDownloadURL();
        imageUrls.add(imageUrl);
      }

      // Process and upload images for product variations
      List<Map<String, dynamic>> productVariationsData = [];
      if(product.productVariations != null) {
         for (final variation in product.productVariations!) {
          log('Uploading product variation: ${variation.id}');
          String? variationImageUrl;

          if (variation.image.isNotEmpty) {
            final imageData = await rootBundle.load(variation.image);
            final bytes = imageData.buffer.asUint8List();
            final storageRef = firebaseStorage.ref(
                'my_products/${product.id}/variations/${variation.id}/${variation.image.split('/').last}');
            final uploadTask = await storageRef.putData(bytes);
            variationImageUrl = await uploadTask.ref.getDownloadURL();
          }

          // Update the variation data with the image URL
          productVariationsData.add({
            'id': variation.id,
            'sku': variation.sku,
            'image': variationImageUrl ?? '',
            'description': variation.description,
            'price': variation.price,
            'salePrice': variation.salePrice,
            'stock': variation.stock,
            'attributeValues': variation.attributeValues,
          });
        }
      }
     

      // Update product data in Firestore
      await productRef.set({
        'title': product.title,
        'stock': product.stock,
        'price': product.price,
        'isFeatured': product.isFeatured,
        'description': product.description,
        // get the brand brand model from firebase collection
        'brand':
            await (_firestore.collection('Brands').doc(product.brand.id).get())
                .then(
          (value) {
            return value.data();
          },
        ),
        'images': imageUrls,
        'salePrice': product.salePrice,
        'sku': product.sku,
        'categoryId': product.categoryId,
        'productAttributes': product.productAttributes
                ?.map((attribute) => attribute.toJson())
                .toList() ??
            [],
        'productVariations': productVariationsData,
        // Assuming ProductVariationModel has a toJson() method
        'productType': product.productType,
        'thumbnail': imageUrls.first, // Assuming the first image as thumbnail
        'brandId': product.brand.id,
        'date': product.date,
      });
    }
  }
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

// * ------------------ Upload all category models with their images ------------------- *
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
}
