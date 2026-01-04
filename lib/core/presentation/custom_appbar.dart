import 'package:flutter/material.dart';
import 'package:coinranking/core/presentation/custom_back_button.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 50,
      leading: CustomBackButton(),
      toolbarHeight: kToolbarHeight + 20,
    );
  }
}
