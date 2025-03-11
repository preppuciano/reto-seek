import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code/src/domain/use_cases/scan_qr_code_use_case.dart';

part 'qr_scan_event.dart';
part 'qr_scan_state.dart';

class QRScanBloc extends Bloc<QRScanEvent, QRScanState> {
  final ScanQRCodesUseCase scanQRCodesUseCase;

  QRScanBloc({required this.scanQRCodesUseCase}) : super(QRScanInitialState()) {
    on<ScanQRScanEvent>(_scanQRScanEvent);
    on<ResetQRScanEvent>(_resetQRScanEvent);
  }

  Future<void> _scanQRScanEvent(
      QRScanEvent event, Emitter<QRScanState> emit) async {
    emit(QRScanScanningState());
    final res = await scanQRCodesUseCase();
    return res.fold((e) {}, (data) {
      return emit(QRScanScannedState(data: data));
    });
  }

  Future<void> _resetQRScanEvent(
      QRScanEvent event, Emitter<QRScanState> emit) async {
    emit(QRScanInitialState());
  }
}
