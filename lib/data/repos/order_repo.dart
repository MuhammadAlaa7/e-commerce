import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:store/data/repos/auth_repo.dart';
import 'package:store/features/shop/models/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final db = FirebaseFirestore.instance;
  final user = AuthenticationRepository.instance.currentAuthUser;

  // get the the user orders from the database

  Future<List<OrderModel>> getAllUserOrders() async {
    try {
      if (user!.uid.isEmpty) {
        throw 'Unable to find the user information , try again later.';
      }
      final snapshot = await db
          .collection('users')
          .doc(user!.uid)
          .collection('orders')
          .get();
      // try to convert the data to model and catch the error of null values
      final orders = snapshot.docs.map((document) {
        try {
          return OrderModel.fromSnapshot(document);
        } catch (e) {
          log(e.toString());
          //   throw 'something went wrong while fetching orders information , please try again later.';
          return OrderModel.empty();
        }
      }).toList();
      return orders;
    } catch (e) {
      log(e.toString());
      throw 'something went wrong while fetching orders information , please try again later.';
    }
  }

// save the order by user and the order in the database

  Future<void> saveOrderToDatabase(OrderModel order, String userId) async {
    try {
      await db
          .collection('users')
          .doc(userId)
          .collection('orders')
          .add(order.toJson());
    } catch (e) {
      throw 'Something went wrong while saving order information , please try again in a few minutes.';
    }
  }
}
