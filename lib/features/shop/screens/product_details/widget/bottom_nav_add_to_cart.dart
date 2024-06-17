import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/icons/circular_icon.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class CBottomNavAddToCart extends StatelessWidget {
  const CBottomNavAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CSizes.defaultSpace, vertical: CSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDark ? CColors.lightDark : CColors.light,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(CSizes.cardRadiusLg),
            topRight: Radius.circular(CSizes.cardRadiusLg)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularIcon(
                icon: Iconsax.minus,
                onPressed: () {},
                width: 40,
                height: 40,
                backgroundColor: Colors.black,
                iconColor: Colors.white,
              ),
              const SizedBox(width: CSizes.spaceBetweenItems),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: CSizes.spaceBetweenItems),
              CircularIcon(
                icon: Iconsax.add,
                onPressed: () {},
                width: 40,
                height: 40,
                backgroundColor: Colors.black,
                iconColor: Colors.white,
              ),
            ],
          ),
          // * this spacer is used to align the button to the right through pushing it
          const Spacer(flex: 1),
          // * the button must be expanded because it is  in a row
          Expanded(
            flex: 2,
            child: DefaultButton(
              label: 'Add To Cart',
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.all(
                  CSizes.md,
                ),
                side: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
