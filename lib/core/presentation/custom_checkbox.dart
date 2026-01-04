import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final Function(bool?)? onChanged;
  final bool value;
  const CustomCheckbox({
    super.key,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 19,
      width: 19,
      child: Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.white,
        checkColor: Colors.black,
        side: BorderSide(color: Colors.grey.shade700, width: 1.5),
      ),
    );
  }
}
