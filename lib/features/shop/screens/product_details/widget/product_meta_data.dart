import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/brands/brand_image.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/sale_container.dart';
import 'package:store/core/common/widgets/shimmers/shimmer_effect.dart';
import 'package:store/core/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:store/core/common/widgets/texts/product_price_text.dart';
import 'package:store/features/shop/controllers/product/product_controller.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/core/utils/constants/enums.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final price = controller.getProductPrice(product);
    final salePercentage =
        controller.getSalePercentage(product.price, product.salePrice);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SaleContainer(sale: salePercentage),
            const SizedBox(
              width: 10,
            ),
            // see first if the product is single and has a sale price to show the old price with line through
            if (product.productType == ProductType.single.name &&
                product.salePrice > 0)
              ProductPriceText(
                price: product.price.toString(),
                lineThrough: true,
              ),
            // make a space between the old price and the new price if the product is single and has a sale price
            if (product.productType == ProductType.single.name &&
                product.salePrice > 0)
              const SizedBox(
                width: 10,
              ),
            // * this the price after the sale if there is sale and if not , it will put the original price
            ProductPriceText(
              price: price,
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        ),
        Text(product.title),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        ),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'status    '),
              TextSpan(
                  text: controller.getProductStockStatus(product.stock),
                  style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        ),
        // * brand section
        Row(
          children: [
            BrandImage(brandImage: product.brand?.image ?? ''),
            const SizedBox(width: 10),
            BrandTitleWithVerifiedIcon(
              title: product.brand?.name ?? '',
              textSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
