import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    this.currencySign = '\$',
    required this.price,
    this.lineThrough = false,
    this.isLarge = false,
    this.maxLines = 1,
  });

  final String currencySign, price;
  final bool lineThrough;
  final bool isLarge;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              // color: Colors.grey,
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
