import 'dart:developer';

import 'package:get/get.dart';
import 'package:store/core/utils/popups/loaders.dart';
import 'package:store/data/repos/product_repo.dart';
import 'package:store/core/utils/constants/enums.dart';
import 'package:store/core/utils/popups/toasts.dart';

import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final productRepo = Get.put(ProductRepository());

// list of featured products
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  RxBool isLoading = false.obs;

// product details
  // Selected indices
  var selectedColor = 'red'.obs; // default selected color
  var selectedSize = 'EU 34'.obs; // default selected size

  // List of available colors and sizes
  final List<String> colors = ["green", "red", "black"];
  final List<String> sizes = ["EU 34", "EU 36", "EU 37"];

  void selectColor(String color) {
    selectedColor.value = color;
  }

  void selectSize(String size) {
    selectedSize.value = size;
  }

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  /// fetch featured products
  Future<void> fetchFeaturedProducts() async {
    try {
      /// start loader
      isLoading.value = true;

      // fetch featured products
      final products = await productRepo.getFeaturedProducts();

      // update featured products
      featuredProducts.assignAll(products);

      log('products fetched successfully');
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Opps!', message: e.toString());
      log('error in fetching products');
    } finally {
      isLoading.value = false;
    }
  }

  Future<ProductModel> fetchProductById(String productId) async {
    try {
      /// start loader
      AppLoaders.loadingOverLayDialog();

      // fetch featured products
      final product = await productRepo.getProductById(productId);

      return product;
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Opps!', message: e.toString());
      log('error in fetching the product');
      return ProductModel.empty();
    } finally {
      Get.back();
    }
  }

// *************----------- Helper Functions -----------**************

// Get the product price and price range for variations

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // if no variations exist , return a simple price or a sale price if there is sale

    if (product.productType == ProductType.single.name) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
// there is a variation , so we need to calculate the smallest and largest prices

      for (var variation in product.productVariations!) {
        // determine the price to consider ( either sale price or regular price )

        double priceToConsider =
            (variation.salePrice > 0 ? variation.salePrice : variation.price);

        // update the smallest and largest prices

//This is a common programming pattern when you need to
// find the smallest and largest values in a list.

/* 
What Happens During the Loop?
When you start iterating through the variations, smallestPrice will quickly be set to the price of the first variation, because any real price will be less than infinity.
Likewise, largestPrice will be set to the first variation’s price, because any real price will be greater than zero.
As you continue to loop through the variations, the function checks each variation’s price and updates smallestPrice if it finds a lower price, and largestPrice if it finds a higher price.

 */

        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

//* determine the range of prices
      // if the smallest and largest prices are the same , return the single price

      if (smallestPrice.isEqual(largestPrice)) {
        // it means all variations have the same price,
        //so it returns this single price.
        return smallestPrice.toString();
      } else {
        return '$smallestPrice - $largestPrice';
      }
    }
  }

// calculate the sale percentage of a product

  String getSalePercentage(
    double originalPrice,
    double? salePrice,
  ) {
    if (salePrice == null || salePrice <= 0) {
      return '0';
    }
    if (originalPrice <= 0) {
      return '0';
    }
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    // the percentage will be rounded to the nearest whole number and no decimal places will be shown in the string.
    return percentage.toStringAsFixed(0);
  }

// check product stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
