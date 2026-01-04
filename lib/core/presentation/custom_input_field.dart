import 'package:flutter/material.dart';
import 'package:coinranking/core/config/colors_constant.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  bool obscureText;
  Widget? icon;
  final VoidCallback? onTap;
  TextEditingController? controller;
  String? Function(String?)? validation;
  TextInputType? textInputType;
  bool? hasError;
  bool? isEditable;
  String? prefixText;
  Color filledColor;
  double borderRadius;
  int maxLine;
  final String? labelText;
  final String? description;
  final Color borderColor;
  final TextStyle? hintTextStyle;
  final EdgeInsetsGeometry? padding;

  CustomInputField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.icon,
    this.onTap,
    this.controller,
    this.validation,
    this.textInputType,
    this.hasError,
    this.isEditable,
    this.prefixText,
    this.filledColor = Colors.transparent,
    this.borderRadius = 10,
    this.maxLine = 1,
    this.labelText,
    this.borderColor = ColorsConstant.stroke,
    this.hintTextStyle,
    this.description,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(labelText!, style: TextStyle(fontSize: 14, color: Colors.white)),
        SizedBox(height: 10),
        if (description != null)
          Text(
            description ?? '',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontStyle: FontStyle.italic,
              fontSize: 12,
            ),
          ),
        TextFormField(
          obscureText: obscureText,
          validator: validation,
          obscuringCharacter: '*',
          readOnly: isEditable ?? false,
          controller: controller,
          onTap: onTap,
          maxLines: maxLine,
          keyboardType: textInputType ?? TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 0, height: 0),
            errorMaxLines: 1,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor, width: 2),
            ),
            contentPadding:
                padding ?? EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            filled: true,
            fillColor: filledColor,
            hintText: hintText,
            suffixIcon: icon != null ? icon : null,
            hintStyle:
                hintTextStyle ??
                TextStyle(fontSize: 16, color: ColorsConstant.greyText),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
