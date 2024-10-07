import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/searched_container.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'store_featured_brands.dart';

class SliverAppBarContent extends StatelessWidget {
  const SliverAppBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.sm),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          // * [1]-- Search bar
          SearchContainer(
            text: 'Search in store',
            margin: EdgeInsets.only(top: 10),
            showBackgroundColor: false,
          ),
          SizedBox(
            height: AppSizes.spaceBetweenItems,
          ),
          // * [2] -- Featured Brands

          StoreFeaturedBrands(),
        ],
      ),
    );
  }
}
