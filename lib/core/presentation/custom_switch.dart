import 'package:flutter/material.dart';
import 'package:coinranking/core/config/colors_constant.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Color? inactiveTrackColor;
  final Function(bool)? onChange;
  const CustomSwitch({
    super.key,
    required this.onChange,
    required this.value,
    this.inactiveTrackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.75,
      child: Switch(
        padding: EdgeInsets.symmetric(horizontal: 8),
        value: value,
        onChanged: onChange,
        activeColor: Colors.white,
        activeTrackColor: ColorsConstant.blue,
        inactiveThumbColor: Colors.white,
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        inactiveTrackColor: inactiveTrackColor ?? ColorsConstant.stroke,
        // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
