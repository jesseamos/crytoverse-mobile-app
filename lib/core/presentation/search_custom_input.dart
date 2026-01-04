import 'package:flutter/material.dart';
import 'package:coinranking/core/config/colors_constant.dart';
import 'package:coinranking/core/icons/vectors_icons.dart';
import 'package:coinranking/core/presentation/svg_icon.dart';

class SearchCustomInput extends StatelessWidget {
  final double height;
  final Function(String)? onChanged;
  const SearchCustomInput({super.key, this.height = 38, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        onChanged: onChanged,
        style: TextStyle(color: Colors.white),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Search campaigns',

          prefixIcon: Transform.scale(
            scale: 0.5,
            child: SvgIcon(svgPath: searchIcon, size: 24),
          ),
          hintStyle: TextStyle(
            color: ColorsConstant.greyText,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: ColorsConstant.stroke, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: ColorsConstant.stroke, width: 2),
          ),
        ),
      ),
    );
  }
}
