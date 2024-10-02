import 'dart:developer';

import 'package:get/get.dart';
import 'package:store/data/repos/product_repo.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/core/utils/local_storage/storage_util.dart';
import 'package:store/core/utils/popups/toasts.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    initFavorites();
    super.onInit();
  }

//! MapEntry: This is a Dart class that represents a single key-value pair.
// ! (key, value) => MapEntry(key, value as bool) >>>>> is a method return a key-value pair from the iterable
// the data comes from hive will be map < string , dynamic > , so we need to convert it to map < string , bool >
// * Get the favorite products from the hive box in local storage
  void initFavorites() {
    // get the favorites data from storage which is in the form of map<string , dynamic >
    // and convert it to the form of map<string , bool >

    final storedFavorites = Map<String, bool>.from(
        AppLocalStorage.instance().readData('favorites') ?? {});
    // update the favorites with the stored favorites after converting its items

    // deal with the stored favorites as map<string , dynamic>
//  storedFavorites.map((key, value) => MapEntry(key, value)),
    favorites.assignAll(storedFavorites);
  }

  bool isFavorite(String productId) {
    // if the product is in the favorites then return true else return false
    return favorites[productId] ?? false;
  }

// toggle favorite product
  void toggleFavorite(String productId) {
    // if the product is not in the favorites then add it
    if (!favorites.containsKey(productId)) {
      // * add a pair of key and value to the favorites map
      favorites.addAll(
        {productId: true},
      );
      // show a snack bar that the product is added to favorites
      AppToasts.customToast(message: 'Product added to favorites');
    } else {
      // if the product is in the favorites then remove it
      favorites.remove(productId);

      // show a snack bar that the product is removed from favorites
      AppToasts.customToast(message: 'Product removed from favorites');
    }
    //* after the addition or removal of the product , save the favorites in the local storage
    // save the favorites to storage
    // * we store the data into the hive box here in the form of  [ map < string , map < string , bool > >  ]
    AppLocalStorage.instance().saveData('favorites', favorites);
    // update the favorites by refreshing it
    favorites.refresh();
  }

// get the favorite products from firebase according to the favorites map here , to show them in the wishlist screen
  Future<List<ProductModel>> fetchFavoriteProducts() async {
    try {
      // check first if the favorites map is not empty
      // *don't make a firebase call if the favorites map is empty
      if (favorites.isNotEmpty) {
        // take the keys of the favorites and convert them to a list
        //and get the products from the firebase based on the this list of ids [ keys ]
        return await ProductRepository.instance
            .getFavoriteProducts(favorites.keys.toList());
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      AppToasts.errorSnackBar(title: 'Oops!', message: e.toString());
      return [];
    }
  }
}
