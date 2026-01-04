import 'package:flutter/material.dart';
import 'package:coinranking/core/config/colors_constant.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularProgressBar extends StatelessWidget {
  final double progress;
  const CircularProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 49,
      height: 49,
      child: CircularPercentIndicator(
        radius: 24.5, // (49 / 2) for a snug fit
        lineWidth: 3,
        percent: (progress.clamp(0, 100) / 100),
        progressColor: ColorsConstant.green,
        backgroundColor: Colors.grey.shade800,
        center: Text(
          '${(progress).toStringAsFixed(0)}%',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        circularStrokeCap: CircularStrokeCap.round,
      ),
    );
  }
}
