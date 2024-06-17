import 'package:flutter/material.dart';
import 'package:store/common/widgets/products/cart/add_remove_button.dart';
import 'package:store/common/widgets/products/cart/cart_item.dart';
import 'package:store/common/widgets/texts/product_price_text.dart';
import 'package:store/utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) {
       
        return Column(
          children: [
            // * cart image and title
            const CartItem(),
            if (showAddRemoveButton)
              const SizedBox(height: CSizes.spaceBetweenItems),

            // * add and remove button and price
            if (showAddRemoveButton)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                      ),
                      ProductQuantityWithAddRemoveButton(),
                    ],
                  ),
                  ProductPriceText(
                    price: '123',
                    isLarge: false,
                  ),
                ],
              ),
          ],
        );
      },
      separatorBuilder: (_, index) {
        return const SizedBox(height: CSizes.md);
      },
      itemCount: 2,
    );
  }
}
