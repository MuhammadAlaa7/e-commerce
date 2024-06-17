import 'package:flutter/material.dart';
import 'package:store/common/widgets/images_with_text/vertical_image_text.dart';
import 'package:store/features/shop/screens/sub_categories/sub_categories_screen.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/helper/helper_functions.dart';

class HomeCategoriesListView extends StatelessWidget {
  const HomeCategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return VerticalImageText(
            title: 'shoes',
            image: CImages.animalIcon,
            onTap: () {
              CHelperFunctions.goTo(context, const SubCategoriesScreen());
            },
          );
        },
        itemCount: 6,
      ),
    );
  }
}
