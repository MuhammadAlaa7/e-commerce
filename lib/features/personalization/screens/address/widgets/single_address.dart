import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: isSelected ? false : true,
      borderColor: isDark ? CColors.darkGrey2 : CColors.lightGrey,
      padding: const EdgeInsets.all(CSizes.md),
      margin: const EdgeInsets.only(bottom: CSizes.spaceBetweenItems),
      backgroundColor:
          isSelected ? CColors.primary.withOpacity(0.4) : Colors.transparent,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Muhammad Alaa',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: CSizes.sm / 2,
              ),
              Text(
                '(+123) 456 789',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: CSizes.sm / 2,
              ),
              Text(
                'Egypt Mansourah Belqas Abodashisha elzawawya street Dr Alaa Eltrawy house ',
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              isSelected ? Iconsax.tick_circle5 : null,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
