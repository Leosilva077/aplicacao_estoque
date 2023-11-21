import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/theme/contants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(gradient: gradient),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Flexible(
                    child: CircleAvatar(
                      // Mude esta linha
                      backgroundColor: secondaryColor,
                      radius: 112.5, // Mude esta linha
                      child: Icon(
                        Icons.person,
                        size: 200,
                        color: linear3,
                      ), // Mude esta linha
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextButton(
                    onPressed: () {
                      // Navegue para a tela de registro
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: linear2,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Crie sua conta grátis',
                      style: TextStyle(
                        fontSize: 18,
                        color: tertiaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // Navegue para a tela de login
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: linear2,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Faça login',
                      style: TextStyle(
                        fontSize: 18,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Crie sua conta grátis ou faça login',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
