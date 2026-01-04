import 'package:flutter/material.dart';
import 'package:coinranking/core/config/colors_constant.dart';
import 'package:shimmer/shimmer.dart';

class GlobalShimmer extends StatelessWidget {
  final Widget child;

  const GlobalShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsConstant.darkgrey,
      highlightColor: ColorsConstant.stroke,
      child: child,
    );
  }
}
