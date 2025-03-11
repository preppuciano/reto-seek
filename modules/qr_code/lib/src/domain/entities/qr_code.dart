import 'package:uuid/uuid.dart';

class QRCode {
  String id;
  final String data;
  final DateTime createdAt;

  QRCode({String? id, required this.data, required this.createdAt})
      : id = id ?? Uuid().v4();
}
