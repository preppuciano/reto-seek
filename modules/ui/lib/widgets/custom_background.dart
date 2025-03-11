import 'package:flutter/material.dart';
import 'package:core/core.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  const CustomBackground({super.key, required this.child, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: AppColor.softWhite),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10), child: child),
          ],
        ),
      ),
    );
  }
}
