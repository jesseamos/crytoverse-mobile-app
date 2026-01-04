import 'package:flutter/material.dart';
import 'package:coinranking/core/config/colors_constant.dart';
import 'package:coinranking/core/presentation/custom_input_field.dart';

class InputWithSubtext extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String description;
  final VoidCallback? onTap;
  final bool? isReadOnly;
  final Widget? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validation;
  final TextInputType? textInputType;

  const InputWithSubtext({
    super.key,
    required this.description,
    required this.hintText,
    required this.labelText,
    this.isReadOnly,
    this.icon,
    this.onTap,
    this.controller,
    this.validation,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.white),
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontStyle: FontStyle.italic,
            fontSize: 12,
          ),
        ),
        CustomInputField(
          isEditable: isReadOnly,
          onTap: onTap,
          icon: icon,
          hintText: hintText,
          filledColor: ColorsConstant.darkgrey,
          borderColor: Colors.transparent,
          controller: controller,
          validation: validation,
          textInputType: textInputType,
        ),
      ],
    );
  }
}
