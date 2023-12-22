import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/contants.dart';
import 'package:flutter_application_1/widget/widget_social_Apple.dart';
import 'package:flutter_application_1/widget/widget_social_google.dart';
import '../widget/widget_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: backgroundColor,
        leading: const Icon(
          Icons.arrow_back,
          color: primaryColor,
          size: 35,
        ),
      ),
      body: _getBody(),
      backgroundColor: backgroundColor,
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(height: 76),
            Form(
              child: Column(
                children: [
                  texFormField(label: 'Email', icon: Icons.email_outlined),
                  const SizedBox(height: 49),
                  texFormField(label: 'Senha', icon: Icons.key_outlined),
                ],
              ),
            ),
            const SizedBox(height: 43),
            GestureDetector(
                onTap: null,
                child: const Text(
                  'Esqueceu a senha?',
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: null,
              child: Column(
                children: [
                  Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          color: secondaryColor),
                      child: const Center(
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: backgroundColor,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "------ OU -------",
              style: TextStyle(
                color: secondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonTheme(
              child: Column(children: [
                elevatedButtonSocialGoogle(
                  child: Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                      fit: BoxFit.cover,
                      width: 30,
                      height: 30),
                  text: 'Entre com Google',
                  color: primaryColor,
                  secundaryColor:
                      const MaterialStatePropertyAll(secondaryColor),
                ),
                const SizedBox(height: 18),
                elevatedButtonSocialApple(
                  icon: Icons.apple,
                  text: 'Entre com Apple',
                  color: primaryColor,
                  prymaryColor: const MaterialStatePropertyAll(primaryColor),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
