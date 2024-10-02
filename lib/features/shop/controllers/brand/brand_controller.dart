import 'dart:developer';

import 'package:get/get.dart';
import 'package:store/data/repos/brand_repo.dart';
import 'package:store/data/repos/product_repo.dart';
import 'package:store/features/shop/models/brand_model.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/core/utils/popups/toasts.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final brandRepo = Get.put(BrandRepository());
  final productRepo = ProductRepository.instance;
  RxList<BrandModel> categoryBrands = <BrandModel>[].obs;
  // RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<ProductModel> brandProducts = <ProductModel>[].obs;

  final RxString selectedSortOption = 'Name'.obs;

  final RxBool isLoading = false.obs;

// on inti
  @override
  void onInit() {
    super.onInit();
    fetchFeaturedBrands();
    // you must make two controllers one for featured brands and one for all brands
    // to reduce the number of api calls
  }

// fetch featured brands

  Future<List<BrandModel>> fetchFeaturedBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandRepo.getFeaturedBrands();
      return brands;
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }

// fetch all brands

  Future<List<BrandModel>> fetchAllBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandRepo.getAllBrands();

      return brands;
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }

// fetch brand products

  Future<List<ProductModel>> fetchProductsByBrandId(String brandId) async {
    try {
      final products = await productRepo.getProductsByBrandId(brandId);
      // brandProducts.assignAll(products);
      return products;
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());

      log('error in fetching brand products$e');
      return [];
    }
  }

// * fetch category brands  by category id

  Future<List<BrandModel>> fetchBrandsByCategoryId(String categoryId) async {
    try {
      final brands = await brandRepo.getBrandsByCategoryId(categoryId);
      return brands;
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());

      return [];
    }
  }
}
