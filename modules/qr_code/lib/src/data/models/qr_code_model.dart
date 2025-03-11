import 'package:qr_code/src/domain/entities/qr_code.dart';

class QRCodeModel extends QRCode {
  QRCodeModel(
      {required super.id, required super.data, required super.createdAt});

  factory QRCodeModel.fromJson(json) {
    return QRCodeModel(
        id: json["id"], data: json["data"], createdAt: json["createdAt"]);
  }

  factory QRCodeModel.fromEntity(QRCode qrCode) {
    return QRCodeModel(
        id: qrCode.id, data: qrCode.data, createdAt: qrCode.createdAt);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "data": data,
      "createdAt": createdAt,
    };
  }
}
