import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/success_screen/success_screen.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/data/repos/order_repo.dart';
import 'package:store/features/personalization/controllers/user/address_controller.dart';
import 'package:store/features/shop/controllers/product/checkout_controller.dart';
import 'package:store/features/shop/models/order_model.dart';
import 'package:store/navigation_menu.dart';
import 'package:store/core/utils/constants/enums.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/helper/network_manager.dart';
import 'package:store/core/utils/popups/full_screen_loader.dart';

import '../../../../core/utils/popups/toasts.dart';
import '../cart/cart_item_controller.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

// variables
  final cartController = CartItemController.instance;
  final checkoutController = CheckoutController.instance;
  final addressController = AddressController.instance;

  final orderRepo = Get.put(OrderRepository());

  //* fetch all user orders
  Future<List<OrderModel>> fetchAllUserOrders() async {
    try {
      final orders = await orderRepo.getAllUserOrders();
      return orders;
    } catch (e) {
      AppToasts.errorSnackBar(title: 'Opps!', message: e.toString());
      return [];
    }
  }

  // process the order with the total amount of the cart items

  Future<void> processOrder(double totalAmount) async {
    try {
      // start loader
      FullScreenLoader.openLoadingDialog(
          'Processing...', AppImages.pencilAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.closeLoadingDialog();
        AppToasts.errorSnackBar(
            title: 'Opps!', message: 'No internet connection');
        return;
      }
      // get the user
      final userId = AuthenticationRepository.instance.currentAuthUser?.uid;
      if (userId!.isEmpty) {
        FullScreenLoader.closeLoadingDialog();
        AppToasts.errorSnackBar(
            title: 'Opps!',
            message: 'Unable to find the user information , try again later.');
        return;
      }

      // prepare an order to be saved in the database
      final order = OrderModel(
        // generate a unique id for the order
        id: UniqueKey().toString(),
        userId: userId,
        orderStatus: OrderStatus
            .pending, // the first order status is pending >> first step in the order process
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        // set the time as you need according to data
        deliveryDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        cartItems: cartController.cartItems.toList(),
        address: addressController.currentSelectedAddress.value,
      );

      // save the order >> take the order prepared and the user id and save it
      await orderRepo.saveOrderToDatabase(order, userId);
      // update the cart
      cartController.clearCart();
      // show the success screen and close the current screen
      //  CFullScreenLoader.closeLoadingDialog();

      Get.off(() => SuccessScreen(
            image: AppImages.orderCompletedAnimation,
            title: 'Payment Success!',
            subTitle:
                'Your item has been placed successfully and will be shipped soon. ',
            onPressed: () {
              Get.offAll(() => const HomeMenu());
            },
          ));
    } catch (e) {
      log(e.toString());
      FullScreenLoader.closeLoadingDialog();
      AppToasts.errorSnackBar(title: 'Opps!', message: e.toString());
    }
  }
}
