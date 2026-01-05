import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coinranking/core/config/colors_constant.dart';
import 'package:coinranking/core/presentation/svg_icon.dart';

class ServicesMetricesCard extends StatelessWidget {
  final String icon;
  final String title;
  final String count;
  const ServicesMetricesCard({
    super.key,
    required this.count,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: ColorsConstant.darkgrey,
        border: Border.all(color: ColorsConstant.stroke, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Row(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgIcon(svgPath: icon, size: 28),
              SizedBox(
                width: 90.w,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: ColorsConstant.greyText,
                  ),
                ),
              ),
            ],
          ),
          Text(
            count,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
