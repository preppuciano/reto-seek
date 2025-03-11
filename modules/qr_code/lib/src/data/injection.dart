import 'package:get_it/get_it.dart';
import 'package:qr_code/qr_code.dart';
import 'package:qr_code/src/data/datasources/qr_code_local_datasource.dart';
import 'package:qr_code/src/data/datasources/scan_qr_local_datasource.dart';
import 'package:qr_code/src/data/repositories/qr_code_repository_impl.dart';
import 'package:qr_code/src/domain/repositories/qr_code_repository.dart';
import 'package:qr_code/src/domain/use_cases/get_qr_codes_use_case.dart';
import 'package:qr_code/src/domain/use_cases/save_qr_code_use_case.dart';
import 'package:qr_code/src/domain/use_cases/scan_qr_code_use_case.dart';

final sl = GetIt.instance;

Future<void> inject() async {
  sl.registerFactory(
      () => QRCodeBloc(getQRCodesUseCase: sl(), saveQRCodeUseCase: sl()));

  sl.registerLazySingleton(() => GetQRCodesUseCase(repository: sl()));
  sl.registerLazySingleton(() => SaveQRCodeUseCase(repository: sl()));
  sl.registerLazySingleton<QRCodeRepository>(() => QRCodeRepositoryImpl(
      qrCodeLocalDatasource: sl(), scanQRLocalDatasource: sl()));
  sl.registerLazySingleton<QRCodeLocalDatasource>(
      () => HiveQRCodeLocalDatasource());
  sl.registerLazySingleton<ScanQRLocalDatasource>(
      () => PigeonScanQRLocalDatasource());
  //
  sl.registerFactory(() => QRScanBloc(scanQRCodesUseCase: sl()));

  sl.registerLazySingleton(() => ScanQRCodesUseCase(repository: sl()));
}
