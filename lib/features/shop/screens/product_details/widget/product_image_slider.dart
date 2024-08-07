import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:store/common/widgets/icons/circular_icon.dart';
import 'package:store/common/widgets/images/rounded_image.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunctions.isDarkMode(context);
    return CurvedEdgesWidget(
      child: Container(
        color: isDark ? CColors.darkGrey2 : CColors.lightGrey.withOpacity(0.3),
        child: Stack(
          children: [
            // * product main large image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(CSizes.lg * 1.5),
                child: Center(
                  child: Image(
                    image: AssetImage(CImages.tracksuit_black),
                    height: 400,
                  ),
                ),
              ),
            ),

            // * app bar
            const CustomAppBar(
              showBackArrow: true,
              actions: [
                CircularIcon(
                  icon: Iconsax.heart5,
                  iconColor: Colors.red,
                ),
              ],
            ),

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
                      return RoundedImage(
                        border: Border.all(color: CColors.primary),
                        backgroundColor: isDark ? CColors.dark : CColors.light,
                        width: 80,
                        height: 80,
                        padding: const EdgeInsets.all(CSizes.sm),
                        imageUrl: CImages.tshirt_blue_collar,
                      );
                    },
                    separatorBuilder: (_, __) {
                      return const SizedBox(width: CSizes.md);
                    },
                    itemCount: 6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
