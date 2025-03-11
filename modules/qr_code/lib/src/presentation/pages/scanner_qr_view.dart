import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/qr_code.dart';
import 'package:qr_code/src/presentation/pages/widgets/data_content.dart';
import 'package:ui/widgets/custom_app_bar.dart';
import 'package:ui/widgets/custom_background.dart';
import 'package:ui/widgets/custom_button.dart';

class ScannerQRView extends StatelessWidget {
  const ScannerQRView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: CustomAppBar(title: "QR Scanner"),
      child: BlocListener(
        bloc: BlocProvider.of<QRCodeBloc>(context),
        listener: (context, state) {
          if (state is QRCodeSavedState) {
            BlocProvider.of<QRScanBloc>(context).add(ResetQRScanEvent());
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder(
                bloc: BlocProvider.of<QRScanBloc>(context),
                builder: (context, scanState) {
                  if (scanState is QRScanScannedState) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: DataContent(data: scanState.data)),
                            BlocBuilder(
                              bloc: BlocProvider.of<QRCodeBloc>(context),
                              builder: (context, codeState) {
                                return IconButton(
                                  icon: Icon(Icons.save),
                                  onPressed: codeState is QRCodeSavingState
                                      ? null
                                      : () => context.read<QRCodeBloc>().add(
                                          SaveQRCodeEvent(
                                              data: scanState.data)),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              CustomButton(
                text: 'Scan',
                onPressed: () =>
                    BlocProvider.of<QRScanBloc>(context).add(ScanQRScanEvent()),
              ),
              SizedBox(height: 5),
              CustomButton(
                text: 'Historial',
                buttonType: CustomButtonType.secondary,
                onPressed: () => context.pushNamed("qr_code_list_view"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
