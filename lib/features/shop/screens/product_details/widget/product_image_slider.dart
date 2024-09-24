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

class ProductImages extends StatelessWidget {
  const ProductImages({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final imageController = Get.put(ProductImagesController());
    final images = imageController.getAllImages(product);

    final isDark = AppHelperFunctions.isDarkMode(context);
    return CurvedEdgesWidget(
      child: Container(
        color: isDark ? AppColors.darkerGrey : AppColors.lightGrey,
        child: Stack(
          children: [
            // * [1] product main large image
            SizedBox(
              height: Get.height * 0.58,
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.lg * 1.5),
                child: Center(
                  child: Obx(() {
                    final image = imageController.selectedProductImage.value;

                    return GestureDetector(
                      onTap: () => imageController.showLargeImageDialog(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, progress) =>
                            CircularProgressIndicator(
                          value: progress.progress,
                          color: AppColors.primary,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            // *[2] app bar
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
                        borderColor:
                            imageController.selectedProductImage.value ==
                                    images[index]
                                ? AppColors.primary
                                : Colors.transparent,
                        borderThickness: 1.5,
                        backgroundColor:
                            isDark ? AppColors.dark : AppColors.light,
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                        padding: const EdgeInsets.all(AppSizes.sm),
                        imageUrl: images[index],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(width: AppSizes.md);
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
