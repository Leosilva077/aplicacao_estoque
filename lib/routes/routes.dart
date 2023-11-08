import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/bottonNavigationBar.router.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/welcome.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "BarNavigator",
      routes: {
        "TelaInicio": (context) => WelcomeScreen(),
        "TelaLogin": (context) => LoginScreen(),
        "BarNavigator": (context) => BottonNavigatioRender(),
      },
    );
  }
}
