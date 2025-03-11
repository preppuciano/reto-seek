import 'package:core/src/presentation/widgets/qr_code_scanner_pigeon/qr_code_scanner_api.dart';
import 'package:flutter/material.dart';

class QRCodeScannerPigeon extends StatefulWidget {
  const QRCodeScannerPigeon({super.key});

  @override
  State<QRCodeScannerPigeon> createState() => _QRCodeScannerPigeonState();
}

class _QRCodeScannerPigeonState extends State<QRCodeScannerPigeon> {
  String textFromNative = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text.rich(
            TextSpan(
              text: 'Text from the other side::',
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: textFromNative,
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            onPressed: () async {
              final data = await getQRCodeScannerApiData();
              setState(() => textFromNative = data);
            },
            child: const Text('Call native code'),
          )
        ],
      ),
    );
  }
}
