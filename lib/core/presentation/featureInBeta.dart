import 'package:flutter/material.dart';
import 'package:coinranking/core/presentation/close_modal.dart';

class FeatureInBeta extends StatelessWidget {
  final String? title;
  final String? description;
  const FeatureInBeta({super.key, this.description, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 28),
        Row(
          children: [
            Expanded(
              child: Text(
                title ?? 'Feature In Beta-Test',
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge?.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(width: 28, child: CloseModal()),
          ],
        ),
        SizedBox(height: 16),
        Text(
          description ??
              'The update timezone feature is currently in better test and not available to everyone yet. You will be notified as soon as it goes live',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16),
        ),
        SizedBox(height: 28),
      ],
    );
  }
}
