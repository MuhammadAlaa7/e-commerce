import 'package:flutter/material.dart';
import 'package:store/common/widgets/images/custom_circular_image.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.title,
    required this.image,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.isNetworkImage = true,
    this.onTap,
  });

  final String title;
  final String image;
  final Color? backgroundColor;
  final Color textColor;
  final bool isNetworkImage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: CSizes.spaceBetweenItems),
        child: Column(
          children: [
            CustomCircularImage(
              image: image,
              fit: BoxFit.cover,
              padding: CSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              imageColor: CHelperFunctions.isDarkMode(context) ? CColors.light : CColors.dark ,
            ),
            const SizedBox(height: CSizes.spaceBetweenItems / 2),
            SizedBox(
              width: 56,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



/* 

  Container(
              padding: const EdgeInsets.all(CSizes.sm),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor ??
                    (CHelperFunctions.isDarkMode(context)
                        ? Colors.black
                        : Colors.white),
              ),
              height: 56,
              width: 56,
              child: Center(
                child: Image(
                  color: CHelperFunctions.isDarkMode(context)
                      ? Colors.white
                      : Colors.black,
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
              ),
            ),
 */