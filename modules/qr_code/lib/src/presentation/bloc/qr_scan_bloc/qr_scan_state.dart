part of 'qr_scan_bloc.dart';

abstract class QRScanState extends Equatable {
  const QRScanState();

  @override
  List<Object?> get props => [];
}

class QRScanInitialState extends QRScanState {}

class QRScanScanningState extends QRScanState {}

class QRScanScannedState extends QRScanState {
  final String data;
  const QRScanScannedState({required this.data});
}
