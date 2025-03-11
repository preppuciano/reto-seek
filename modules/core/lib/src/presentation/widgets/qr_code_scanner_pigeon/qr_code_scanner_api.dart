import 'package:core/src/presentation/widgets/qr_code_scanner_pigeon/qr_code_scanner_api.g.dart';

final _api = QRCodeScannerApi();

Future<String> getQRCodeScannerApiData() async {
  try {
    return await _api.getData();
  } catch (e) {
    return 'Failed to retrieve result';
  }
}
