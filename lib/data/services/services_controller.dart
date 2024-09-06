import 'package:get/get.dart';
import 'package:store/data/services/firebase_storage_service.dart';
import 'package:store/dummy_data.dart';

class ServicesController extends GetxController {
  static ServicesController get to => Get.find();

  final storageService = Get.put(CustomFirebaseStorageService());

// * upload banners
  Future<void> uploadBannerWithImages() async {
    try {
      print('Uploading banners...');
      await storageService.uploadBannersWithImages(DummyData.banners);
      print('Banners uploaded successfully!');
    } catch (e) {
      print('Error uploading banners: $e');
    }
  }

// * upload brands
  Future<void> uploadBrandsWithImages() async {
    try {
      print('Uploading brands...');
      await storageService.uploadBrandsWithImages(DummyData.brands);
      print('brands  uploaded successfully!');
    } catch (e) {
      print('Error uploading brands: $e');
    }
  }

// * upload brands category relationship
  Future<void> uploadBrandCategory() async {
    try {
      print('Uploading brand category ...');
      await storageService.uploadBrandCategories(DummyData.brandCategory);
      print('brand category uploaded successfully!');
    } catch (e) {
      print('Error uploading brand category: $e');
    }
  }

// * upload product category relationship
  Future<void> uploadProductCategory() async {
    try {
      print('Uploading product category ...');
      await storageService.uploadProductCategories(DummyData.productCategories);
      print(' product category uploaded successfully!');
    } catch (e) {
      print('Error uploading product category: $e');
    }
  }

// * upload categories
  Future<void> uploadCategoriesWithImages() async {
    try {
      print('Uploading categories...');
      await storageService.uploadCategoriesWithImages(DummyData.categories);
      print('categories uploaded successfully!');
    } catch (e) {
      print('Error uploading categories: $e');
    }
  }



// * ************************ update uploadProductsWithTheirImages ***************

  Future<void> deleteField() async {
    try {
      print('Uploading products...');
      await storageService.removeFieldFromProducts(DummyData.products);
      print('fields removed successfully!');
    } catch (e) {
      print('Error uploading products: $e');
    }
  }



// ! ************************  uploadProductsWithTheirImages ***************

  Future<void> uploadProductsWithTheirImages() async {
    try {
      print('Uploading products...');
      await storageService.uploadProductsWithImages(DummyData.products);
      print('Products uploaded successfully!');
    } catch (e) {
      print('Error uploading products: $e');
    }
  }
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// * ************************  update Products fields ***************

  Future<void> updateProductsFields( ) async {
    try {
      print('updating products...');
        
                  await storageService.updateProducts( DummyData.products
            );
       
      print('Products updated successfully!');
    } catch (e) {
      print('Error updating products: $e');
    }
  }




}
