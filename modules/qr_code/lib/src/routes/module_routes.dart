import 'package:go_router/go_router.dart';
import 'package:qr_code/src/presentation/pages/qr_code_list_view.dart';

List<GoRoute> routes = [
  GoRoute(
    name: 'qr_code_list_view',
    path: 'qr_code_list_view',
    builder: (context, state) {
      return QRCodeListView();
    },
  ),
];
