import 'package:core/core.dart';
import 'package:flutter/material.dart';

class DataContent extends StatelessWidget {
  final String data;
  const DataContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColor.graySpace,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: AppColor.charcoalColor,
          width: 1,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contenido:",
            style: TextStyle(
                fontSize: AppConfig.fontSizeSM, color: AppColor.charcoalColor),
          ),
          Text(
            data,
            style: TextStyle(
              fontSize: AppConfig.fontSizeMD,
              color: AppColor.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
