import 'package:flutter/material.dart';
import 'package:coinranking/core/presentation/custom_back_button.dart';

class CustomAppbarWithLogo extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbarWithLogo({super.key});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CustomBackButton(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 44,
            width: 180,
            child: Image.asset(
              'assets/images/networkX.png',
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
      centerTitle: true,
    );
  }
}
