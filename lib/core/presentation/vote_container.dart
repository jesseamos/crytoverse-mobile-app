import 'package:flutter/material.dart';
import 'package:coinranking/core/config/colors_constant.dart';
import 'package:coinranking/core/icons/vectors_icons.dart';
import 'package:coinranking/core/presentation/svg_icon.dart';

class VoteContainer extends StatelessWidget {
  final int count;
  final Function()? onTap;
  final Color? iconColor;
  final String icon;
  final bool isLoading;
  const VoteContainer({
    super.key,
    required this.count,
    required this.icon,
    this.iconColor,
    this.isLoading = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsConstant.primaryBlack,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: EdgeInsets.all(2),
        child: Row(
          spacing: 4,
          children: [
            if (!isLoading) ...[
              SvgIcon(
                svgPath: icon,
                size: 16,
                color: iconColor ?? Colors.white,
              ),
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ] else ...[
              SizedBox(
                child: CircularProgressIndicator(),
                height: 20,
                width: 20,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
