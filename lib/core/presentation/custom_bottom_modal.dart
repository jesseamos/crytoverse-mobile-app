import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:coinranking/core/config/colors_constant.dart';

Future<T?> showBlurryModalBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  BoxBorder? border,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,

    backgroundColor: ColorsConstant.darkgrey,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            right: 16,
            left: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          decoration: BoxDecoration(
            border:
                border ?? Border.all(color: ColorsConstant.stroke, width: 4),
            color: Colors.black.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: child,
        ),
      );
    },
  );
}
