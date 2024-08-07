import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:store/common/widgets/images/rounded_image.dart';
import 'package:store/common/widgets/loaders/shimmer_effect.dart';
import 'package:store/features/shop/controllers/banner/banner_controller.dart';
import 'package:store/features/shop/models/banner_model.dart';
import 'package:store/features/shop/screens/store/store_screen.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

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
        return const SizedBox(height: 0,);
      } else {
        return Column(
          children: [
            CarouselSlider(
             
              items: bannerController.banners
                  .map((banner) => RoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList(),
              options: CarouselOptions(
                // -- this is also responsible for separating the items in the slider with a space between them
                enlargeCenterPage: true,
                viewportFraction: 1,
                onPageChanged: (index, _) {
                  bannerController.changeBannerIndex(index);
                },
              ),
            ),
            const SizedBox(height: CSizes.spaceBetweenSections),

            // * -- banner indicators

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < bannerController.banners.length; i++)
                  CircularContainer(
                    margin: const EdgeInsets.only(right: 10),
                    height: 6,
                    width: 20,
                    backgroundColor:
                        bannerController.currentBannerIndex.value == i
                            ? CColors.primary
                            : Colors.grey[400]!,
                  ),
              ],
            ),
          ],
        );
      }
    });
  }
}
