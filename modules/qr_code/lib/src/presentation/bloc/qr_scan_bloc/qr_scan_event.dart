part of 'qr_scan_bloc.dart';

abstract class QRScanEvent extends Equatable {
  const QRScanEvent();
  @override
  List<Object?> get props => [];
}

class ScanQRScanEvent extends QRScanEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ResetQRScanEvent extends QRScanEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
