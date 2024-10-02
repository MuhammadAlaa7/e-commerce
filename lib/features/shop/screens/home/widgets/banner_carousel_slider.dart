import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/images/rounded_image.dart';
import 'package:store/core/routes/routes.dart';
import 'package:store/features/shop/controllers/banner/banner_controller.dart';

import '../../all_products/all_products_screen.dart';

class BannerCarouselSlider extends StatelessWidget {
  const BannerCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannerController = BannerController.instance;
    return CarouselSlider(
      items: bannerController.banners
          .map((banner) => RoundedImage(
                fit: BoxFit.fill,
                imageUrl: banner.imageUrl,
                isNetworkImage: true,
                onPressed: () => Get.to(
                  () => AllProductsScreen(
                      title: 'All Products',
                      query:
                          FirebaseFirestore.instance.collection('MyProducts')),
                ),
              ))
          .toList(),
      options: CarouselOptions(
        // -- this is also responsible for separating the items in the slider
        // with a space between them
        enlargeCenterPage: true,
        viewportFraction: 1,
        onPageChanged: (index, _) {
          bannerController.changeBannerIndex(index);
        },
      ),
    );
  }
}
