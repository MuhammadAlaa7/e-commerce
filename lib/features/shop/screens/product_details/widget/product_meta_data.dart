import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/sale_container.dart';
import 'package:store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:store/common/widgets/texts/product_price_text.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            SaleContainer(sale: 25),
            SizedBox(
              width: 10,
            ),
            ProductPriceText(
              price: '250',
              lineThrough: true,
            ),
            SizedBox(
              width: 10,
            ),
            ProductPriceText(
              price: '170',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems,
        ),
        const Text('black Nike Jacket'),
        const SizedBox(
          height: CSizes.spaceBetweenItems,
        ),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'status    '),
              TextSpan(
                  text: 'In Stock',
                  style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems,
        ),
        Row(
          children: [
            Image(
              image: const AssetImage(CImages.clothIcon),
              height: 20,
              color: CHelperFunctions.isDarkMode(context)
                  ? Colors.white
                  : Colors.black,
            ),
            const SizedBox(width: 10),
            const BrandTitleWithVerifiedIcon(
              title: 'Nike',
              textSize: TextSize.medium,
            ),
          ],
        ),
      ],
    );
  }
}
