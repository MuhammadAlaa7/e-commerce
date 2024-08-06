import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * heading
        HeadingSection(
          buttonTitle: 'Change',
          title: 'Payment Method',
          onPressed: () {},
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems / 2,
        ),
        Row(
          children: [
            const RoundedContainer(
              width: 60,
              height: 35,
              padding: EdgeInsets.all(CSizes.sm),
              backgroundColor: Colors.transparent,
              child: Image(
                fit: BoxFit.contain,
                image: AssetImage(
                  CImages.paypal,
                ),
              ),
            ),
            const SizedBox(
              width: CSizes.spaceBetweenItems / 2,
            ),
            Text(
              'Paypal',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ],
    );
  }
}
