import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/buttons/outlined_button.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/core/utils/constants/sizes.dart';

class ProductImagesController extends GetxController {
  static ProductImagesController get instance => Get.find();
// -- variables : 
    // currently selected image by the user 
  RxString selectedProductImage = ''.obs;



// -- methods :

///* get all images from product 

  List<String> getAllImages(ProductModel product) {
    // make a list of only unique images , using set not a list
    Set<String> uniqueImages = {};

    // load thumbnail images  as the first image 
    // thumbnail is separated from other images in the product model 
    uniqueImages.add(product.thumbnail);

    // assign thumbnail as current selected image
    selectedProductImage.value = product.thumbnail;

    // get all images from product if not null
    if (product.images != null) {
      uniqueImages.addAll(product.images!);
    }

// get all images from variations if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      uniqueImages.addAll(
          product.productVariations!.map((variation) => variation.image));
    }
    // convert set to list
    return uniqueImages.toList();
  }

  // show large image popup dialog
  void showLargeImageDialog(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.defaultSpace * 2,
                  horizontal: AppSizes.defaultSpace),
              child: CachedNetworkImage(
                imageUrl: image,
              ),
            ),
            const SizedBox(height: AppSizes.spaceBetweenSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomOutlinedButton(
                width: 140,
                label: 'Close',
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
