import 'package:flutter/material.dart';
import 'package:store/common/styles/text_styles.dart';
import 'package:store/utils/constants22/sizes.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.width = double.infinity, 
  });
  final String label;
  final double width ; 
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CSizes.buttonRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: CTextStyles.buttonLabelTextStyle(context),
        ),
      ),
    );
  }
}
