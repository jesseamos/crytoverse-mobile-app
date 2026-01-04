import 'package:flutter/material.dart';
import 'package:coinranking/core/config/colors_constant.dart';

class QuickActionCard extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget child;
  const QuickActionCard({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: ColorsConstant.darkgrey,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorsConstant.stroke, width: 2),
      ),
      width: double.infinity,
      child: child,
    );
  }
}
