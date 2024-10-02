import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/shimmers/shimmer_effect.dart';
import 'package:store/features/shop/controllers/banner/banner_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';

import 'banner_carousel_slider.dart';
import 'banner_indicators.dart';

class HomeBannerSection extends StatelessWidget {
  const HomeBannerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());
    return Obx(() {
      if (bannerController.isLoading.value == true) {
        return const CustomShimmerEffect(
          height: 150,
          width: double.infinity,
        );
      }
      if (bannerController.banners.isEmpty) {
        // no banners found
        return const SizedBox(
          height: 0,
        );
      } else {
        return const Column(
          children: [
             BannerCarouselSlider(),
             SizedBox(height: AppSizes.spaceBetweenItems),

            // * -- banners indicators

            BannerIndicators(),
          ],
        );
      }
    });
  }
}
