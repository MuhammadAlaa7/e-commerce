import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:store/common/widgets/icons/circular_icon.dart';
import 'package:store/common/widgets/images/rounded_image.dart';
import 'package:store/common/widgets/products/product_card/favorite_icon.dart';
import 'package:store/features/shop/controllers/product/product_images_controller.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final imageController = Get.put(ProductImagesController());
    final images = imageController.getAllImages(product);
    log(images.toString());
    final isDark = CHelperFunctions.isDarkMode(context);
    return CurvedEdgesWidget(
      child: Container(
        color: isDark ? CColors.darkGrey2 : CColors.lightGrey.withOpacity(0.3),
        child: Stack(
          children: [
            // * product main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(CSizes.lg * 1.5),
                child: Center(
                  child: Obx(() {
                    final image = imageController.selectedProductImage.value;

                    return GestureDetector(
                      onTap: () => imageController.showLargeImageDialog(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, progress) => CircularProgressIndicator(
                          value: progress.progress,
                          color: CColors.primary,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            // * app bar
             CustomAppBar(
              showBackArrow: true,
              actions: [
              CustomFavoriteIcon(productId: product.id,),
              ],
            ),
            // * Images slider
            Positioned(
              bottom: 30,
              right: 0,
              left: 20,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Obx(
                      () => RoundedImage(
                        onPressed: () => imageController
                            .selectedProductImage.value = images[index],
                        isNetworkImage: true,
                        border: Border.all(
                            color: imageController.selectedProductImage.value ==
                                    images[index]
                                ? CColors.primary
                                : Colors.transparent),
                        backgroundColor: isDark ? CColors.dark : CColors.light,
                        width: 80,
                        height: 80,
                        padding: const EdgeInsets.all(CSizes.sm),
                        imageUrl: images[index],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(width: CSizes.md);
                  },
                  itemCount: images.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
