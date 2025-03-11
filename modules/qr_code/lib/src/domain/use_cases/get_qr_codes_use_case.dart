import 'package:dartz/dartz.dart';
import 'package:qr_code/src/domain/entities/qr_code.dart';
import 'package:qr_code/src/domain/repositories/qr_code_repository.dart';

class GetQRCodesUseCase {
  final QRCodeRepository repository;
  const GetQRCodesUseCase({required this.repository});

  Future<Either<Exception, List<QRCode>>> call() {
    return repository.getQRCodes();
  }
}
