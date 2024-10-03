
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/images/rounded_image.dart';
import 'package:store/features/shop/controllers/product/product_images_controller.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';



class ProductImagesSlider extends StatelessWidget {
  const ProductImagesSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // -- variables :
    final imageController = ProductImagesController.instance;//
    final images = imageController.getAllImages(product);
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Positioned(
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
                onPressed: () {},
                  //  imageController.selectedProductImage.value = images[index],
                isNetworkImage: true,
                borderColor: AppColors.darkerGrey , 
                    // imageController.selectedProductImage.value == images[index]
                    //     ? AppColors.primary
                    //     : Colors.transparent,
                borderThickness: 1.5,
                backgroundColor: isDark ? AppColors.dark : AppColors.light,
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
    );
  }
}
