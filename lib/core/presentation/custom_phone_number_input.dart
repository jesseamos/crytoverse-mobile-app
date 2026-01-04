import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:coinranking/core/config/colors_constant.dart';

class CustomPhoneNumberInput extends StatelessWidget {
  final TextEditingController? controller;
  const CustomPhoneNumberInput({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        const Text(
          'Phone Number',
          style: TextStyle(
            color: Colors.white, // Match dark theme
            fontSize: 14,
          ),
        ),

        SizedBox(
          //height: 50,
          child: IntlPhoneField(
            // controller: controller,
            disableLengthCheck: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            dropdownIconPosition: IconPosition.trailing,
            dropdownDecoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: ColorsConstant.stroke, width: 2),
              ),
            ),
            pickerDialogStyle: PickerDialogStyle(
              backgroundColor: ColorsConstant.stroke,
              countryNameStyle: TextStyle(
                fontSize: 14,
                color: ColorsConstant.greyText,
              ),
              searchFieldCursorColor: Colors.white,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 16,
              ),
              isDense: true,
              filled: true,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: ColorsConstant.stroke, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: ColorsConstant.stroke, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: ColorsConstant.stroke, width: 2),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              errorStyle: TextStyle(color: Colors.red, fontSize: 12),
            ),
            initialCountryCode: 'US',
            style: TextStyle(color: ColorsConstant.greyText, fontSize: 16),
            dropdownTextStyle: TextStyle(
              color: ColorsConstant.greyText,
              fontSize: 16,
            ),
            dropdownIcon: Icon(
              Icons.arrow_drop_down,
              color: ColorsConstant.greyText,
            ),
            onChanged: (phone) {
              controller?.text = '${phone.countryCode}${phone.number}';
            },
            validator: (_) {
              if (controller?.text == null) {
                return 'Please enter your Phone Number';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
