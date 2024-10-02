import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:store/core/common/widgets/app_bar/custom_tab_bar.dart';


import 'package:store/features/shop/models/category_model.dart';
import 'package:store/core/utils/constants/colors.dart';

import 'package:store/core/utils/helper/helper_functions.dart';


import 'store_heading_content.dart';




class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.featuredCategories,
  });

  final RxList<CategoryModel> featuredCategories;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      expandedHeight: AppHelperFunctions.screenHeight() * 0.6,
      backgroundColor: AppHelperFunctions.isDarkMode(context)
          ? AppColors.dark
          : AppColors.light,
      // a space to put widgets into it [ content ]
      // * the app bar content [ search bar , featured brands , taps bar ]
      flexibleSpace: const StoreHeadingContent(),
      bottom: CustomTapBar(
        tabs: featuredCategories
            .map((category) => Tab(
                  text: category.name,
                ))
            .toList(),
      ),
    );
  }
}
