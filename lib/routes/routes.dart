import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/bottonNavigationBar.router.dart';
import 'package:flutter_application_1/screens/cadastrar_produto.dart';
import 'package:flutter_application_1/screens/cadastre.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/welcome.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "TelaInicio",
      routes: {
        "TelaInicio": (context) => const WelcomeScreen(),
        "TelaLogin": (context) => const LoginScreen(),
        "BarNavigator": (context) => const BottonNavigatioRender(),
        "TelaCadastraProduto": (context) => const ProductScreen(),
        "TelaCadastroUsuario": (context) => const CadastreScreen(),
      },
    );
  }
}
