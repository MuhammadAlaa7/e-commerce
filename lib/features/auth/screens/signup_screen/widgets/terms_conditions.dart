import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/auth/controllers/signup/signup_controller.dart';
import 'package:store/utils/constants22/colors.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/constants22/text_strings.dart';
import 'package:store/utils/helper/helper_functions.dart';

class TermsAndConditionsCheckBox extends StatelessWidget {
  const TermsAndConditionsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = CHelperFunctions.isDarkMode(context);
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
                      ? CColors.primary
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
          width: CSizes.spaceBetweenItems,
        ),
        // !Wrapping the text with flexible  allowing it to take the all available space in the row
        // !  to prevent the text overflow

        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: CTexts.iAgreeTo,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: CTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: CColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            isDark ? Colors.white : CColors.primary,
                      ),
                ),
                TextSpan(
                  text: ' and ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: CTexts.termsOfUse,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        overflow: TextOverflow.ellipsis,
                        color: CColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            isDark ? Colors.white : CColors.primary,
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
