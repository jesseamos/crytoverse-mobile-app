import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coinranking/core/config/colors_constant.dart';

class StatusBadge extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Color? bgColor;
  final Color? borderColor;
  const StatusBadge({
    super.key,
    required this.title,
    this.bgColor,
    this.titleColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.h,
      child: IntrinsicWidth(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: bgColor ?? ColorsConstant.lighterGreen,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor ?? Colors.transparent),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: titleColor ?? ColorsConstant.green,
              fontSize: 10.sp,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
