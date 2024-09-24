import 'package:flutter/material.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    required this.value,
    required this.text,
  });

  final double value;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(text),
        ),
        Expanded(
          flex: 10,
          child: LinearProgressIndicator(
            value: value,
            borderRadius: BorderRadius.circular(15),
         //   color: Colors.red,
            backgroundColor: Colors.grey.shade300,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            minHeight: 11,
          ),
        )
      ],
    );
  }
}
