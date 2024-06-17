import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/searched_container.dart';
import 'package:store/common/widgets/custom_shapes/primary_header_container.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/utils/constants/sizes.dart';
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
          SizedBox(height: CSizes.spaceBetweenSections / 2),
          // * search bar
          SearchContainer(text: 'Search in shop'),
          SizedBox(height: CSizes.spaceBetweenSections / 2),
          // * popular categories
          Padding(
            padding: EdgeInsets.only(left: CSizes.defaultSpace),
            child: Column(
              children: [
                // -- this is a custom header for any section in the app
                HeadingSection(
                  title: 'Popular Categories',
                  showActionButton: false,
                  textColor: Colors.white,
                ),
                SizedBox(height: CSizes.spaceBetweenSections),
                // * home categories
                HomeCategoriesListView(),
                SizedBox(
                  height: CSizes.spaceBetweenSections,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
