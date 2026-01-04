import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:coinranking/core/icons/vectors_icons.dart';
import 'package:coinranking/core/presentation/svg_icon.dart';

class CloseModal extends StatelessWidget {
  const CloseModal({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerRight,
        child: SvgIcon(svgPath: closeModalIcon, size: 28),
      ),
    );
  }
}
