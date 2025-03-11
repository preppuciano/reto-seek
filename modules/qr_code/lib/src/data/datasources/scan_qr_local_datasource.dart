import 'package:core/core.dart';
import 'package:flutter/material.dart';

abstract class ScanQRLocalDatasource {
  Future<String> scanQR();
}

class PigeonScanQRLocalDatasource implements ScanQRLocalDatasource {
  const PigeonScanQRLocalDatasource();
  @override
  Future<String> scanQR() async {
    try {
      final res = await getQRCodeScannerApiData();
      return res;
    } catch (err) {
      debugPrint(err.toString());
      throw Exception("err");
    }
  }
}
