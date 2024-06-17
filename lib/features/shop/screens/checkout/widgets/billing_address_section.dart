import 'package:flutter/material.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // * heading
        HeadingSection(
          buttonTitle: 'Change',
          title: 'Shipping Address',
          onPressed: () {},
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems / 2,
        ),

        Text(
          'Muhammad Alaa',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems / 2,
        ),
        Row(children: [
          const Icon(Icons.phone, color: Colors.grey, size: 16),
          const SizedBox(
            width: CSizes.spaceBetweenItems,
          ),
          Text(
            '+966 1234567890',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ]),
        const SizedBox(
          height: CSizes.spaceBetweenItems / 2,
        ),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(
              width: CSizes.spaceBetweenItems,
            ),
            Expanded(
              // * make it expanded to prevent the overflow for the text
              child: Text(
                'Alaa Street, Alaa City, Alaa Country ',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
