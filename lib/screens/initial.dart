import 'package:flutter/material.dart';
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
                children: <Widget>[
                  const Flexible(
                    child: CircleAvatar(
                      backgroundColor: secondaryColor,
                      radius: 112.5,
                      child: Icon(
                        Icons.person,
                        size: 200,
                        color: linear3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  Container(
                    width: 185,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(130),
                        color: linear2),
                    child: const Center(
                      child: Text(
                        'ENTRAR',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Entre ou crie sua conta gratuita',
                            style: TextStyle(color: secondaryColor)),
                      ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
