import 'package:flutter/material.dart';
import 'package:coinranking/core/config/colors_constant.dart';

class CustomTabbar extends StatefulWidget {
  final TabController controller;
  final List<Widget> tabs;
  final Function(int?)? onTap;
  const CustomTabbar({
    super.key,
    required this.controller,
    required this.tabs,
    this.onTap,
  });
  static const routeName = '/history';

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsConstant.darkgrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TabBar(
          physics: NeverScrollableScrollPhysics(),
          onTap: widget.onTap,
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          dividerHeight: 0,
          controller: widget.controller,
          tabs: widget.tabs,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: ColorsConstant.activeTabColor,
            borderRadius: BorderRadius.circular(8),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: ColorsConstant.greyText,
          labelStyle: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          // indicatorPadding: EdgeInsets.symmetric(vertical: 7),
        ),
      ),
    );
  }
}
