import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:store/core/utils/constants/colors.dart';

import '../../../controllers/banner/banner_controller.dart';

class BannerIndicators extends StatelessWidget {
  const BannerIndicators({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannerController = BannerController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < bannerController.banners.length; i++)
          CircularContainer(
            margin: const EdgeInsets.only(right: 10),
            height: 6,
            width: 20,
            backgroundColor: i == bannerController.currentBannerIndex.value
                ? AppColors.primary
                : Colors.grey[400]!,
          ),
      ],
    );
  }
}
