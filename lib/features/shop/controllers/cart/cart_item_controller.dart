import 'dart:developer';

import 'package:get/get.dart';
import 'package:store/features/shop/controllers/product/variation_controller.dart';
import 'package:store/features/shop/models/cart_item_model.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/features/shop/models/product_variation_model.dart';
import 'package:store/core/utils/constants/enums.dart';
import 'package:store/core/utils/local_storage/storage_util.dart';
import 'package:store/core/utils/popups/toasts.dart';

class CartItemController extends GetxController {
  static CartItemController get instance => Get.find();
  RxInt numberOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  // variation controller
  final variationController = VariationController.instance;
  // final variationController = Get.put(VariationController());

// initialization
  @override
  void onInit() {
    super.onInit();
    // get the cart items
    loadCartItems();
  }

//* add one item to the cart from out side the cart screen , from the + button on the product item
  void addOneItemToCart(CartItemModel cartItem) {
    // check if the product exists
    int index =
        cartItems.indexWhere((item) => item.productId == cartItem.productId);
    if (index >= 0) {
      // it exists , so add its quantity by 1
      cartItems[index].quantity++;
    } else {
      // add it , as it doesn't exist yet
      cartItems.add(cartItem);
    }
    //! update the cart
    updateCart();
  }

  void removeOneItemFromCart(CartItemModel cartItem) {
    // check if the product exists
    int index =
        cartItems.indexWhere((item) => item.productId == cartItem.productId);
    if (index >= 0) {
      // it exists , so decrease its quantity by 1
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        // remove it not the quantity
        cartItems[index].quantity == 1
            ? showRemoveFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }
    //! update the cart
    updateCart();
  }

  void showRemoveFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove product',
      middleText: 'Are you sure you want to remove this product ?',
      onConfirm: () {
        // remove the item from the cart
        cartItems.removeAt(index);
        updateCart();
        AppToasts.customToast(message: 'product removed from the cart');
        Get.back();
      },
      // * it will do nothing , it will just close the dialog
      onCancel: () {},
    );
  }

  // ! ************************   ******* add item in the cart *******************************************

  void addToCart(ProductModel product) {
    // quantity check
    if (productQuantityInCart < 1) {
      AppToasts.customToast(message: 'please enter quantity');
      return;
    }

    // check if the product has variations BUT no variation is selected yet
    if (product.productType == ProductType.variable.name &&
        variationController.selectedVariation.value.id.isEmpty) {
      // it means that the current product has variations and the user must choose a variation from this product
      // variation here means : the product has many choices and the user must choose one of them
      AppToasts.customToast(message: 'please select a variation');
      return;
    }
    // check out of stock for both < single product and variable product >
    if (product.productType == ProductType.variable.name) {
      if (variationController.selectedVariation.value.stock == 0) {
        AppToasts.warningSnackBar(title: 'Opps!', message: 'out of stock');
        return;
      }
    } else {
      // single product
      if (product.stock == 0) {
        AppToasts.warningSnackBar(title: 'Opps!', message: 'out of stock');
        return;
      }
    }

    // convert the product to cart item with the given quantity
    final selectedCartItem =
        convertProductToCartItem(product, productQuantityInCart.value);

    log('selected cart item: ${selectedCartItem.toJson()}');
    // check if the cart item is already in the cart
    // returns -1 if the item is not found
    int index = cartItems.indexWhere(
        (cartItem) => cartItem.productId == selectedCartItem.productId);
    // if it is in the cart
    if (index >= 0) {
      // index here used to know if the cart item is in the cart or not and where it is the place of it to update its quantity

      // for example : -> if it is found in the index 2 so the third item  quantity will be modified

      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      // not in the cart
      cartItems.add(selectedCartItem);
    }

    // update the cart list
    // 1. update the total price of the whole cart items according to price and quantity  of each item  and also the number of items in the cart depending on the total quantity of all items
    // 2. save the cart items in the local storage by converting the cart items list to json data and saving it in the local storage
    // 3. refresh the cart items list in the controller to update the UI
    updateCart();

    AppToasts.customToast(message: 'Your product added to cart');
  }

  // a function to convert the product model to cart item model

  CartItemModel convertProductToCartItem(ProductModel product, int quantity) {
    // check if it is single product
    if (product.productType == ProductType.single.name) {
      // reset variations
      variationController.resetSelectedAttributes();
    }
// if the condition above is true so it it single so the selected variation will be empty
    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0
            ? product.salePrice
            : product.price;
    // return cart item model if the whether the product is single or variation
    log('product id : ${product.id}');
    log('is variable : ${isVariation}');
    log('variation id : ${variation.id}');
    log('cart items count : ${cartItems.length}');
    return CartItemModel(
      productId: product.id,
      quantity: quantity,
      title: product.title,
      image: isVariation ? variation.image : product.thumbnail,
      price: price,
      variationId: variation.id,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculateTotalPrice = 0.0;
    int calculateNumberOfItems = 0;
    for (var item in cartItems) {
      calculateTotalPrice += (item.price) * item.quantity.toDouble();
      calculateNumberOfItems += item.quantity;
    }

    // update the variables above  int
    numberOfCartItems.value = calculateNumberOfItems;

    totalCartPrice.value = calculateTotalPrice;
  }

  void saveCartItems() {
    // make a list of map<String, dynamic> of cart items data [ json format ] to be stored in hive local storage
    final cartItemsJson = cartItems.map((item) => item.toJson()).toList();
    AppLocalStorage.instance().saveData('cartItems', cartItemsJson);
  }

  // load / get cart items from local storage to be shown in the ui once the cart screen is opened
  void loadCartItems() {
    final cartItemsJson =
        AppLocalStorage.instance().readData<List<dynamic>>('cartItems');
    // convert it to model
    if (cartItemsJson != null) {
      cartItems.assignAll(
        cartItemsJson.map(
          (item) => CartItemModel.fromJson(item),
        ),
      );
      // after assigning ... update the total or cart items
      updateCartTotals();
    }
  }

  // get the single product quantity in the cart
  int getProductQuantityInCart(ProductModel product) {
    int quantity = 0;
    for (var item in cartItems) {
      if (item.productId == product.id) {
        quantity = item.quantity;
        break;
      }
    }
    return quantity;
  }

// get the variation quantity in the cart
  int getVariationQuantityInCart(
      ProductModel product, ProductVariationModel variation) {
    int quantity = 0;
    for (var item in cartItems) {
      if (item.productId == product.id && item.variationId == variation.id) {
        quantity = item.quantity;
        break;
      }
    }
    return quantity;
  }

  // clear the cart , from the ui and the storage
  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

// update the count of the product that is already added to the cart
  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.name) {
      productQuantityInCart.value = getProductQuantityInCart(product);
    } else {
      final variation = variationController.selectedVariation.value;
      if (variation.id.isNotEmpty) {
        productQuantityInCart.value =
            getVariationQuantityInCart(product, variation);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }
}
