import 'package:core/src/presentation/pages/home_view.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/qr_code.dart' as qr_code;

class AppRouter {
  GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) {
          return MainView();
        },
        routes: [
          GoRoute(
            path: "scanner_qr",
            builder: (context, state) {
              return qr_code.ScannerQRView();
            },
            routes: qr_code.routes,
          ),
        ],
      ),
    ],
  );
}
