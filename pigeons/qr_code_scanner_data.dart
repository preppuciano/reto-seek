import 'package:pigeon/pigeon.dart';

// dart run pigeon --input pigeons/qr_code_scanner_data.dart
@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/qr_code_scanner_api.g.dart',
  dartOptions: DartOptions(),
  kotlinOut:
      'android/app/src/main/kotlin/com/qr_code_scanner_data/pigeon/QRCodeScannerApi.g.kt',
  kotlinOptions: KotlinOptions(package: "com.qr_code_scanner_data.pigeon"),
  swiftOut: 'ios/Runner/QRCodeScannerApi.g.swift',
  swiftOptions: SwiftOptions(),
  dartPackageName: 'qr_code_scanner_data',
))

// Flutter -> Native
@HostApi()
abstract class QRCodeScannerApi {
  @async
  String getData();
}
