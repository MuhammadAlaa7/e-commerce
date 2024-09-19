import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/features/personalization/models/address_model.dart';
import 'package:store/features/shop/models/cart_item_model.dart';
import 'package:store/utils/constants22/enums.dart';
import 'package:store/utils/helper/helper_functions.dart';

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus orderStatus;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel address;
  final DateTime? deliveryDate;
  final List<CartItemModel> cartItems;

  OrderModel({
    required this.id,
    required this.userId,
    required this.orderStatus,
    required this.orderDate,
    required this.totalAmount,
    required this.cartItems,
    required this.address,
    this.paymentMethod = 'Paypal',
    this.deliveryDate,
  });

  static OrderModel empty() => OrderModel(
        id: '',
        userId: '',
        orderStatus: OrderStatus.pending,
        orderDate: DateTime.now(),
        totalAmount: 0.0,
        cartItems: [],
        address: AddressModel.empty(),
        paymentMethod: 'Paypal',
        deliveryDate: null,
      );

  String get formattedOrderDate {
    return CHelperFunctions.getFormattedDate(orderDate);
  }

  String get formattedDeliveryDate {
    return deliveryDate != null
        ? CHelperFunctions.getFormattedDate(deliveryDate!)
        : '';
  }

  String get orderStatusText {
    switch (orderStatus) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
      default:
        return 'Pending';
    }
  }

// to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'orderStatus': orderStatus.toString(),
        'totalAmount': totalAmount,
        'orderDate': orderDate,
        'paymentMethod': paymentMethod,
        'address': address.toJson(),
        'deliveryDate': deliveryDate,
        'cartItems': cartItems.map((item) => item.toJson()).toList(),
      };

//
  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    log(data.toString()); // Log the raw data for debugging
    // print each field from the data alone

    return OrderModel(
      id: data['id'], // Use empty string if null
      userId: data['userId'], // Use empty string if null
      orderStatus: data['orderStatus'] != null
          ? OrderStatus.values.firstWhere(
              (e) => e.toString() == data['orderStatus'],
              orElse: () => OrderStatus.unknown, // Handle invalid values
            )
          : OrderStatus.unknown, // Default to 'unknown' if null

      totalAmount: (data['totalAmount'] as num?)?.toDouble() ??
          0.0, // Safely cast to double

      orderDate: (data['orderDate'] as Timestamp?)?.toDate() ??
          DateTime.now(), // Handle null Timestamp

      paymentMethod: data['paymentMethod'],
      // Default empty string if null
      //Provide a default address if null
      deliveryDate: data['deliveryDate'] != null
          ? (data['deliveryDate'] as Timestamp).toDate()
          : null, // Handle optional deliveryDate

      cartItems: (data['cartItems'] as List<dynamic>?)
              ?.map((item) =>
                  CartItemModel.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [], // Safely handle cartItems list or provide empty list
      address: data['address'] != null
          ? AddressModel.fromJson(data['address'] as Map<String, dynamic>)
          : AddressModel.empty(), //
      //  address: AddressModel.empty(),
    );
  }
}
