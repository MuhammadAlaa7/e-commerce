import 'package:flutter/material.dart';

import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/controllers/category/category_controller.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/features/shop/screens/brands/all_brands_screen.dart';
import 'package:store/features/shop/screens/store/widgets/category_tap.dart';

import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';
import 'package:store/features/shop/screens/store/widgets/custom_sliver_app_bar.dart';
import '../../controllers/brand/brand_controller.dart';
import 'widgets/store_app_bar.dart';
import 'widgets/store_featured_brands.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredCategories = CategoryController.instance.featuredCategories;
    return Scaffold(
      appBar: storeAppBar(context),
      body: DefaultTabController(
        //* it is a must to provide a controller above the tab bar to manage the tabs and their views
        length: featuredCategories.length,
        child: NestedScrollView(
          headerSliverBuilder: (_, isInnerBoxScrolled) {
            return [
              // * it is a fixed space to put widgets on it

              //* [1] -- the sliver app bar
              CustomSliverAppBar(featuredCategories: featuredCategories),
            ];
          },
          //* [2] -- the tab bar
          // * The View Of The Tab Bar Above [ this is a page view ]
          body: TabBarView(
            children: featuredCategories
                .map((category) => CategoryTap(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
