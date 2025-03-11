part of 'qr_code_bloc.dart';

abstract class QRCodeState extends Equatable {
  const QRCodeState();

  @override
  List<Object?> get props => [];
}

class QRCodesInitialState extends QRCodeState {}

class QRCodesLoadingState extends QRCodeState {}

class QRCodesLoadedState extends QRCodeState {
  final List<QRCode> qrCodes;
  const QRCodesLoadedState({required this.qrCodes});
}

class QRCodeSavingState extends QRCodeState {}

class QRCodeSavedState extends QRCodeState {}
