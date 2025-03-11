import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code/src/domain/entities/qr_code.dart';
import 'package:qr_code/src/domain/use_cases/get_qr_codes_use_case.dart';
import 'package:qr_code/src/domain/use_cases/save_qr_code_use_case.dart';

part 'qr_code_event.dart';
part 'qr_code_state.dart';

class QRCodeBloc extends Bloc<QRCodeEvent, QRCodeState> {
  final GetQRCodesUseCase getQRCodesUseCase;
  final SaveQRCodeUseCase saveQRCodeUseCase;

  QRCodeBloc({required this.getQRCodesUseCase, required this.saveQRCodeUseCase})
      : super(QRCodesInitialState()) {
    on<GetQRCodesEvent>(_getQRCodesEvent);
    on<SaveQRCodeEvent>(_saveQRCodeEvent);
  }

  Future<void> _getQRCodesEvent(
      GetQRCodesEvent event, Emitter<QRCodeState> emit) async {
    emit(QRCodesLoadingState());
    await Future.delayed(Duration(seconds: 2));
    final res = await getQRCodesUseCase();
    return res.fold((e) {}, (data) {
      return emit(QRCodesLoadedState(qrCodes: data));
    });
  }

  Future<void> _saveQRCodeEvent(
      SaveQRCodeEvent event, Emitter<QRCodeState> emit) async {
    emit(QRCodeSavingState());
    await Future.delayed(Duration(seconds: 2));
    final res = await saveQRCodeUseCase(data: event.data);
    return res.fold((e) {}, (data) {
      return emit(QRCodeSavedState());
    });
  }
}
