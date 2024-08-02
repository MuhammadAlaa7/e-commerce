import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/images_with_text/vertical_image_text.dart';
import 'package:store/common/widgets/loaders/category_shimmer.dart';
import 'package:store/features/shop/controllers/category/category_controller.dart';
import 'package:store/features/shop/screens/sub_categories/sub_categories_screen.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/helper/helper_functions.dart';

class HomeCategoriesListView extends StatelessWidget {
  const HomeCategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // put the categories controller in the getx system
    final categoriesController = Get.put(CategoryController());
    return Obx(() {

      if (categoriesController.isLoading.value == true) {
        return const CustomCategoriesShimmer();
      } 

      if (categoriesController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Popular Categories Found!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
   
        return SizedBox(
          height: 90,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, int index) {
                  final category = categoriesController.featuredCategories[index];
              return VerticalImageText(
                isNetworkImage: true ,
                title: category.name,
                image: category.image, 
                onTap: () {
                  CHelperFunctions.goTo(context, const SubCategoriesScreen());
                },
              );
            },
            itemCount: categoriesController.featuredCategories.length,
          ),
        );
      
    });
  }
}
