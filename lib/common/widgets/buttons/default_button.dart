import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = double.infinity,
    this.style,
  });
  final String label;
  final ButtonStyle? style;
  final void Function()? onPressed;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Text(label),
      ),
    );
  }
}
