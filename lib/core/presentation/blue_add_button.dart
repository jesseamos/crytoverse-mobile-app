import 'package:flutter/material.dart';
import 'package:coinranking/core/config/colors_constant.dart';

class BlueAddButton extends StatelessWidget {
  final Function() onTap;
  const BlueAddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 62,
        height: 38,
        decoration: BoxDecoration(
          color: ColorsConstant.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
