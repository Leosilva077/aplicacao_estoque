import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/bottonNavigationBar.router.dart';
import 'package:flutter_application_1/screens/telaProduto/cadastrar_produto.dart';
import 'package:flutter_application_1/screens/telaCadastro/cadastre.dart';
import 'package:flutter_application_1/screens/telaCategoria/categoria.dart';
import 'package:flutter_application_1/screens/telaLogin/login.dart';
import 'package:flutter_application_1/screens/telaPerfil/profile.dart';
import 'package:flutter_application_1/screens/telaEntrada/welcome.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "TelaCadastroUsuario",
      routes: {
        "TelaInicio": (context) => const WelcomeScreen(),
        "TelaLogin": (context) => const LoginScreen(),
        "BarNavigator": (context) => const BottonNavigatioRender(),
        "TelaCadastraProduto": (context) => const ProductScreen(),
        "TelaCadastroUsuario": (context) => const CadastreScreen(),
        "TelaCategoria": (context) => const CategoriaScreen(),
        "TelaPerfil": (context) => const ProfileScrenn(),
        // "TelaDetalheProduto":
      },
    );
  }
}
