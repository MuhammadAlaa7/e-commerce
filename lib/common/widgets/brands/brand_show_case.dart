import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/brands/featured_brands_item.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/features/shop/models/brand_model.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
  });
  final List<String> images;


  Expanded brandTopProductImageWidget(BuildContext context, String image) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        margin: const EdgeInsets.only(right: CSizes.sm),
        padding: const EdgeInsets.all(CSizes.md),
        backgroundColor: CHelperFunctions.isDarkMode(context)
            ? CColors.darkGrey
            : CColors.lightGrey,
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final BrandModel brand = Get.arguments as BrandModel ;
    return RoundedContainer(
      margin: const EdgeInsets.only(bottom: CSizes.spaceBetweenItems),
      padding: const EdgeInsets.all(CSizes.md),
      backgroundColor: Colors.transparent,
      borderColor: CColors.darkGrey2,
      showBorder: true,
      child: Column(
        //    mainAxisSize: MainAxisSize.min,
        children: [
          // * Brand with product count
           FeaturedBrandCard(
            brandTitle: 'Nike',
            brandId: '',
          
          ),

          // * Brand Top Three Products Images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(context, image))
                .toList(),
          ),
        ],
      ),
    );
  }
}
