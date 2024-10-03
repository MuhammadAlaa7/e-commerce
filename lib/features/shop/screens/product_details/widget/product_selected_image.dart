import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/controllers/product/product_images_controller.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';

class ProductSelectedImage extends StatelessWidget {
  const ProductSelectedImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final imageController = ProductImagesController.instance;
    return SizedBox(
      height: Get.height * 0.58,
      child: Obx(() {
        // the image selected by the user
        final image = imageController.selectedProductImage.value;

        return GestureDetector(
          onTap: () => imageController.showLargeImageDialog(image),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.lg * 1.5),
            child: Center(
              child: CachedNetworkImage(
                imageUrl: image,
                progressIndicatorBuilder: (_, __, progress) =>
                    CircularProgressIndicator(
                  value: progress.progress,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
