import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  final bool value;
  final Function(bool?)? onchanged;
  final Color? fillColor;
  const CustomRadio({
    super.key,
    this.fillColor = Colors.white,
    required this.onchanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Radio<bool>(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      focusColor: Colors.white,
      fillColor: WidgetStateProperty.all<Color>(fillColor!),
      value: value,
      groupValue: true,
      onChanged: onchanged,
    );
  }
}
