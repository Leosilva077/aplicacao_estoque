import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/colors.dart';
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
            height: 47,
          ),
          ButtonTheme(
            child: Column(children: [
              elevatedButtonSocialGoogle(
                label: 'Entrar com Google',
              ),
              const SizedBox(height: 20),
              elevatedButtonSocialApple(
                  label: 'Entrar com Apple', icon: Icons.facebook)
            ]),
          )
        ],
      ),
    );
  }
}
