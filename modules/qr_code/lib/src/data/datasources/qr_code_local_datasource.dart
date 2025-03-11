import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code/src/data/models/qr_code_model.dart';
import 'package:qr_code/src/domain/entities/qr_code.dart';

abstract class QRCodeLocalDatasource {
  Future<void> saveQRCode(QRCodeModel qrCode);
  Future<List<QRCodeModel>> getQRCodes();
}

class HiveQRCodeLocalDatasource implements QRCodeLocalDatasource {
  HiveQRCodeLocalDatasource() {
    Directory.systemTemp.createTemp().then((value) => Hive.init(value.path));
  }

  @override
  Future<List<QRCodeModel>> getQRCodes() async {
    try {
      final qrCodeBox = await Hive.openBox('qrCodeBox');
      return qrCodeBox.values.map((p) => QRCodeModel.fromJson(p)).toList();
    } catch (err) {
      debugPrint(err.toString());
      throw Exception("err");
    }
  }

  @override
  Future<void> saveQRCode(QRCode qrCode) async {
    try {
      final qrCodeBox = await Hive.openBox('qrCodeBox');
      qrCodeBox.put(qrCode.id, QRCodeModel.fromEntity(qrCode).toJson());
    } catch (err) {
      debugPrint(err.toString());
      throw Exception("err");
    }
  }
}
