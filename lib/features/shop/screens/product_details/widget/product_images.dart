import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:store/core/common/widgets/images/rounded_image.dart';
import 'package:store/core/common/widgets/products/product_card/favorite_icon.dart';
import 'package:store/features/shop/controllers/product/product_images_controller.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';
import 'package:store/features/shop/screens/product_details/widget/images_slider.dart';

import 'product_main_image.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // -- variables :
    final imageController = ProductImagesController.instance;
    final images = imageController.getAllImages(product);
    final isDark = AppHelperFunctions.isDarkMode(context);
    return CustomClippedWidget(
      child: Container(
        color: isDark ? AppColors.darkerGrey : AppColors.lightGrey,
        child: Stack(
          children: [
            // * [1] The main large image selected by the user from images slider

            const ProductMainImage(),

            //   const ProductSelectedImage(),

            // *[2] favorite icon button

            CustomAppBar(
              showBackArrow: true,
              actions: [
                CustomFavoriteIcon(
                  iconSize: AppSizes.iconMd,
                  height: 40,
                  width: 40,
                  productId: product.id,
                ),
              ],
            ),

            // *[3] Images slider
            ProductImagesSlider(
              images: images,
            ),
            // ProductImagesSlider(
            //   product: product,
            // ),
          ],
        ),
      ),
    );
  }
}
