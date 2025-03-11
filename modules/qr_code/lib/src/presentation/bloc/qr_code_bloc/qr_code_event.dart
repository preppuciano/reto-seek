part of 'qr_code_bloc.dart';

abstract class QRCodeEvent extends Equatable {
  const QRCodeEvent();
  @override
  List<Object?> get props => [];
}

class GetQRCodesEvent extends QRCodeEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SaveQRCodeEvent extends QRCodeEvent {
  final String data;
  const SaveQRCodeEvent({required this.data});

  @override
  List<Object?> get props => throw UnimplementedError();
}
