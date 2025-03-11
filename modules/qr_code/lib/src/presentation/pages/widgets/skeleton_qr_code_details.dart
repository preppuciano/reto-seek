import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/src/domain/entities/qr_code.dart';
import 'package:qr_code/src/presentation/pages/widgets/qr_code_details.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonQRCodeDetails extends StatelessWidget {
  const SkeletonQRCodeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: AppColor.graySpace.withValues(alpha: 0.5),
        highlightColor: AppColor.graySpace,
      ),
      child: QRCodeDetails(qr: QRCode(data: 'data', createdAt: DateTime.now())),
    );
  }
}
