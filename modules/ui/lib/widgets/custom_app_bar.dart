import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  const CustomAppBar(
      {super.key, required this.title, this.actions, this.leading});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      automaticallyImplyLeading: true,
      flexibleSpace: Container(),
      title: Text(
        title,
        style: const TextStyle(
          height: 1,
          fontSize: AppConfig.fontSizeLG,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      backgroundColor: AppColor.softWhite,
      elevation: 0,
    );
  }
}
