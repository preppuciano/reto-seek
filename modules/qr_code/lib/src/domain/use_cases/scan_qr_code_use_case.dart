import 'package:dartz/dartz.dart';
import 'package:qr_code/src/domain/repositories/qr_code_repository.dart';

class ScanQRCodesUseCase {
  final QRCodeRepository repository;
  const ScanQRCodesUseCase({required this.repository});

  Future<Either<Exception, String>> call() {
    return repository.scanQR();
  }
}
