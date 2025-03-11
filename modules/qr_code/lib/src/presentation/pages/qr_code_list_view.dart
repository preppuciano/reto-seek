import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/src/presentation/bloc/qr_code_bloc/qr_code_bloc.dart';
import 'package:qr_code/src/presentation/pages/widgets/qr_code_details.dart';
import 'package:qr_code/src/presentation/pages/widgets/skeleton_qr_code_details.dart';
import 'package:ui/widgets/custom_app_bar.dart';
import 'package:ui/widgets/custom_background.dart';

class QRCodeListView extends StatelessWidget {
  const QRCodeListView({super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<QRCodeBloc>(context).add(GetQRCodesEvent());
    return CustomBackground(
      appBar: CustomAppBar(title: "Historial"),
      child: BlocBuilder<QRCodeBloc, QRCodeState>(
        builder: (context, state) {
          if (state is QRCodesLoadedState) {
            return ListView.builder(
              itemCount: state.qrCodes.length,
              itemBuilder: (context, index) {
                return QRCodeDetails(
                  qr: state.qrCodes[index],
                );
              },
            );
          } else {
            return Column(
              children: List.generate(3, (index) => SkeletonQRCodeDetails()),
            );
          }
        },
      ),
    );
  }
}
