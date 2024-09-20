import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/auth/controllers/signup/signup_controller.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/constants/text_strings.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class TermsAndConditionsCheckBox extends StatelessWidget {
  const TermsAndConditionsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.find<SignUpController>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          // ? wrap the check box to remove the default padding around it
          height: 20.0,
          width: 20.0,
          child: Obx(
            () => Checkbox(
              fillColor: MaterialStateProperty.all(
                  controller.privacyPolicy.value
                      ? AppColors.primary
                      : Colors.transparent),
              value: controller.privacyPolicy.value,
              onChanged: (value) {
                controller.privacyPolicy.value =
                    !controller.privacyPolicy.value;
              },
            ),
          ),
        ),
        const SizedBox(
          width: AppSizes.spaceBetweenItems,
        ),
        // !Wrapping the text with flexible  allowing it to take the all available space in the row
        // !  to prevent the text overflow

        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: AppTexts.iAgreeTo,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: AppTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            isDark ? Colors.white : AppColors.primary,
                      ),
                ),
                TextSpan(
                  text: ' and ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: AppTexts.termsOfUse,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            isDark ? Colors.white : AppColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
