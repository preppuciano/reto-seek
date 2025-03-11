import 'package:dartz/dartz.dart';
import 'package:qr_code/src/data/datasources/qr_code_local_datasource.dart';
import 'package:qr_code/src/data/datasources/scan_qr_local_datasource.dart';
import 'package:qr_code/src/data/models/qr_code_model.dart';
import 'package:qr_code/src/domain/entities/qr_code.dart';
import 'package:qr_code/src/domain/repositories/qr_code_repository.dart';

class QRCodeRepositoryImpl implements QRCodeRepository {
  final QRCodeLocalDatasource qrCodeLocalDatasource;
  final ScanQRLocalDatasource scanQRLocalDatasource;

  const QRCodeRepositoryImpl({
    required this.qrCodeLocalDatasource,
    required this.scanQRLocalDatasource,
  });

  @override
  Future<Either<Exception, List<QRCode>>> getQRCodes() async {
    try {
      final resp = await qrCodeLocalDatasource.getQRCodes();
      return Right(resp);
    } catch (err) {
      return Left(Exception("ERROR"));
    }
  }

  @override
  Future<Either<Exception, void>> saveQRCode(QRCode qrCode) async {
    try {
      final resp = await qrCodeLocalDatasource
          .saveQRCode(QRCodeModel.fromEntity(qrCode));
      return Right(resp);
    } catch (err) {
      return Left(Exception("ERROR"));
    }
  }

  @override
  Future<Either<Exception, String>> scanQR() async {
    try {
      final resp = await scanQRLocalDatasource.scanQR();
      return Right(resp);
    } catch (err) {
      return Left(Exception("ERROR"));
    }
  }
}
