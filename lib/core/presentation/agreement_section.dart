import 'package:flutter/material.dart';
import 'package:coinranking/core/config/colors_constant.dart';
import 'package:coinranking/core/presentation/custom_checkbox.dart';

class AgreementSection extends StatelessWidget {
  bool agreeToTerms;
  bool agreeToUpdates;
  final Function(bool?) agreeToTermHandler;
  final Function(bool?) agreeToUpdateHandler;

  AgreementSection({
    super.key,
    required this.agreeToTerms,
    required this.agreeToUpdates,
    required this.agreeToTermHandler,
    required this.agreeToUpdateHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCheckbox(value: agreeToTerms, onChanged: agreeToTermHandler),
            Expanded(
              child: Text(
                'I have read and agreed to the terms of the policy pages.',
                style: TextStyle(color: ColorsConstant.greyText, fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCheckbox(
              value: agreeToUpdates,
              onChanged: agreeToUpdateHandler,
            ),
            Expanded(
              child: Text(
                'I agree to receive important updates, offers, and promotions from NetworkX.ai',
                style: TextStyle(color: ColorsConstant.greyText, fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
