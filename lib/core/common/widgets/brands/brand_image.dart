import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/shimmers/shimmer_effect.dart';

import '../../../utils/helper/helper_functions.dart';

class BrandImage extends StatelessWidget {
  const BrandImage({super.key, required this.brandImage});
  final String brandImage;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      color:
          AppHelperFunctions.isDarkMode(context) ? Colors.white : Colors.black,
      imageUrl: brandImage,
      width: 40,
      height: 40,

      //   fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, progress) =>
          const CustomShimmerEffect(
        height: 30,
        width: 30,
        radius: 10,
      ),
    );
  }
}
