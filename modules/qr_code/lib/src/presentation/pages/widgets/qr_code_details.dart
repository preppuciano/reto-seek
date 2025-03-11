import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/src/domain/entities/qr_code.dart';

class QRCodeDetails extends StatelessWidget {
  final QRCode qr;
  const QRCodeDetails({super.key, required this.qr});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 5, top: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColor.softWhite,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: AppColor.charcoalColor,
          width: 1,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            qr.id,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.charcoalColor),
          ),
          Text(
            formatDate(qr.createdAt),
            style: TextStyle(color: AppColor.charcoalColor),
          ),
          Text(
            qr.data,
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
