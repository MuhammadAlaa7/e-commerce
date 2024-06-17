import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //  padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            //  color: Colors.white,
            border: Border.all(color: CColors.lightGrey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              height: CSizes.iconLg,
              width: CSizes.iconLg,
              image: AssetImage(CImages.google),
            ),
          ),
        ),
        const SizedBox(
          width: CSizes.spaceBetweenItems,
        ),
        Container(
          //  padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            //  color: Colors.white,
            border: Border.all(color: CColors.lightGrey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              height: CSizes.iconLg,
              width: CSizes.iconLg,
              image: AssetImage(CImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
