import 'package:dartz/dartz.dart';
import 'package:qr_code/src/domain/entities/qr_code.dart';

abstract class QRCodeRepository {
  Future<Either<Exception, List<QRCode>>> getQRCodes();
  Future<Either<Exception, void>> saveQRCode(QRCode scannedQR);
  Future<Either<Exception, String>> scanQR();
}
