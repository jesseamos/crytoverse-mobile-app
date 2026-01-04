import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coinranking/core/config/colors_constant.dart';
import 'package:coinranking/core/icons/vectors_icons.dart';
import 'package:coinranking/core/presentation/quick_action_card.dart';
import 'package:coinranking/core/presentation/svg_icon.dart';

class ViewCampaignQuickAction extends StatelessWidget {
  final Function() onTap;
  const ViewCampaignQuickAction({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return QuickActionCard(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Action',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 14),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.only(left: 2, right: 12),
              width: double.infinity,
              height: 42.h,
              decoration: BoxDecoration(
                color: ColorsConstant.campaignCardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgIcon(svgPath: campaignCardIcon, size: 30),
                        SizedBox(width: 8),
                        Text(
                          'View Campaigns',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: ColorsConstant.campaignCardColorText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                    color: ColorsConstant.campaignCardColorText,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
