import 'package:dartz/dartz.dart';
import 'package:qr_code/src/domain/entities/qr_code.dart';
import 'package:qr_code/src/domain/repositories/qr_code_repository.dart';

class SaveQRCodeUseCase {
  final QRCodeRepository repository;
  const SaveQRCodeUseCase({required this.repository});

  Future<Either<Exception, void>> call({required String data}) async {
    return repository.saveQRCode(QRCode(data: data, createdAt: DateTime.now()));
  }
}
