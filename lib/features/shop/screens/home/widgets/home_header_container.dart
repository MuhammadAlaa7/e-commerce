import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/searched_container.dart';
import 'package:store/core/common/widgets/custom_shapes/primary_header_container.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'home_app_bar.dart';
import 'home_categories.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PrimaryHeaderContainer(
      child: Column(
        children: [
          //* app bar
          HomeAppBar(),
          SizedBox(height: AppSizes.spaceBetweenItems),
          // * search bar
          SearchContainer(text: 'Search in shop'),
          SizedBox(height: AppSizes.spaceBetweenItems),
          HomePopularCategories(),
          SizedBox(height: AppSizes.spaceBetweenItems / 2),
          // there is a padding from bottom 20 px in the blue clipped container
        ],
      ),
    );
  }
}
