import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:store/data/repos/product_repo.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/core/utils/popups/toasts.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final RxList<ProductModel> allProducts = <ProductModel>[].obs;
  final RxString selectedSortOption = 'Name'.obs;

  // fetch all products from the product repository

  Future<List<ProductModel>> fetchProductByQuery(Query? query) async {
    try {
      final products =
          await ProductRepository.instance.getProductByQuery(query);
      allProducts.assignAll(products);
      return products;
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
      return [];
    }
  }

/// sort the products by the selected option
  void sortProducts(String sortOption) {
    /* 
    a =>  is a placeholder for an element in the list 
    b =>  is a placeholder for the following element  for [ a ] in the list 
    compareTo => is a method that compares two elements and returns an integer : 
    that tells the sort method how to re-order the list >> it returns -1 if [a] should be placed before [b] , 
    0 if they are equal and 1 if [b] should be placed before [a]
     */
    selectedSortOption.value = sortOption;
    
    switch (sortOption) {
      case 'Name':
        allProducts.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        allProducts.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        allProducts.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Sale':
        // ! We need to place the products with a sale first and then the ones without sale
        // ! if all products have sale it will has no effect on the sort
        allProducts.sort((a, b) {
          if (b.salePrice > 0) {
            // if the second product has a sale price then sort by it
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            // if the first product has a sale place it in the
            return -1;
          } else {
            // if both products don't have a sale price then place the first product in the second following order
            return 1;
          }
        });
        break;
      case 'Newest':
        allProducts.sort((a, b) {
          if (a.date == null) {
            return 1;
          } else if (b.date == null) {
            return -1;
          } else {
            return a.date!.compareTo(b.date!);
          }
        });
        break;
      default:
        allProducts.sort((a, b) => a.title.compareTo(b.title));
    }
  }

// assign all products to the list
// this will be triggered once the all products screen is opened to get the products came from
// firebase to be placed in the observable list to apply any change on it based on the selection of the user
  void assignAllProducts(List<ProductModel> products) {
    allProducts.assignAll(products);
    // sort by default by name in the first time
    sortProducts('Name');
  }
}
