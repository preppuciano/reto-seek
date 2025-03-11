import 'package:core/core.dart' as core;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/qr_code.dart' as qr_code;
import 'package:get_it/get_it.dart';

void main() async {
  await qr_code.inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.instance.get<qr_code.QRCodeBloc>()),
        BlocProvider(create: (_) => GetIt.instance.get<qr_code.QRScanBloc>())
      ],
      child: MaterialApp.router(
        title: 'Reto Seek',
        theme: core.AppTheme(),
        routerConfig: core.AppRouter().router,
      ),
    );
  }
}
