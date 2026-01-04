import 'package:flutter/material.dart';
import 'package:coinranking/core/config/colors_constant.dart';

class CountBadge extends StatelessWidget {
  final int count;
  final Color? color;
  final Color? textColor;
  final double? size;
  const CountBadge({
    super.key,
    this.color,
    required this.count,
    this.textColor,
    this.size = 17,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      alignment: Alignment.center,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color ?? ColorsConstant.blue,
      ),
      child: Text(
        '$count',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          fontSize: 10,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
