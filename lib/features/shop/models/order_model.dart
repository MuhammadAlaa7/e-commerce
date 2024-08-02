import 'package:store/features/shop/models/cart_item_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final String status;
  final String date;
  final double total;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.date,
    required this.total,
    required this.items,
  });
}
