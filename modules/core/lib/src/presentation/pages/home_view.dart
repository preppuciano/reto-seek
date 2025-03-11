import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ui/widgets/custom_button.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Reto Seek",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 50,
              ),
            ),
            SizedBox(height: 10),
            CustomButton(text: 'Auth Biometric', onPressed: () => print("")),
            SizedBox(height: 5),
            CustomButton(
                text: 'QR Scanner',
                onPressed: () => context.push("/scanner_qr")),
          ],
        ),
      ),
    );
  }
}
