import 'package:store/features/shop/models/cart_item_model.dart';

class CartModel {
  final String id;
  final List<CartItemModel> items;

  CartModel({
    required this.id,
    required this.items,
  });
}
