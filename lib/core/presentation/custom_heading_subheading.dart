import 'package:flutter/material.dart';

class CustomHeadingSubheading extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Text? subtitleText;
  const CustomHeadingSubheading({
    super.key,
    this.subtitle,
    required this.title,
    this.subtitleText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
        SizedBox(height: 8),
        if (subtitle != null)
          Text(subtitle!, style: Theme.of(context).textTheme.bodySmall),
        if (subtitleText != null) subtitleText!,
      ],
    );
  }
}
