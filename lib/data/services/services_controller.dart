import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:store/data/services/firebase_storage_service.dart';
import 'package:store/dummy_data.dart';
import 'package:store/utils/constants/image_strings.dart';

class ServicesController extends GetxController {
  static ServicesController get to => Get.find();

final storageService = Get.put(CustomFirebaseStorageService());


List<String> imagePaths = [
    CImages.redShoes,
    CImages.jacket,
    CImages.nikeShoes,
    CImages.nikeShoes2,
   
    // ... other image paths
  ];


Future<void> uploadBannerWithImages() async {
  try {
    print('Uploading banners...');
    await storageService.uploadBannersWithImages(DummyData.banners);
    print('Banners uploaded successfully!');
  } catch (e) {
    print('Error uploading banners: $e');
  }
}


Future<void> uploadCategoriesWithImages() async {
  try {
    print('Uploading categories...');
    await storageService.uploadCategoriesWithImages(DummyData.categories);
    print('categories uploaded successfully!');
  } catch (e) {
    print('Error uploading categories: $e');
  }
}



// Future<void> uploadListBannersToFireStore() async {
//  try{
//   print('Uploading banners...');
//   await storageService.uploadBanners(DummyData.banners);
//   print('Banners uploaded successfully!');
//  }catch(e){
//   print('Error uploading banners: $e');
//  }
// }







Future<void> uploadImagesToFireStore() async {
  try {
    print('Uploading images...fffffffffffff');
      List<String> imageUrls = await storageService
          .uploadImageFileListFromAssets(imagePaths, 'images/');
      print(imageUrls); // List of download URLs
    } catch (e) {
      print('Error uploading images: $e');
    }
}



  Future<void> uploadImageToFireStore(String assetPath ) async {

   

    try {
      Uint8List imageData =
          await storageService.getImageDataFromAssets(assetPath);
      String uploadUrl = await storageService.uploadImageData(
        'products/images/sports/', // Replace with your Firebase Storage path
        imageData,
        '1.png', // Choose a desired filename
      );
      print('Image uploaded! Download URL: $uploadUrl');
    } catch (e) {
      print('Error uploading image: $e');
    }





  }
}