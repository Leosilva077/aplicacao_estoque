import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/consts.dart';
import 'package:flutter_application_1/widget/widget_social_Apple.dart';
import 'package:flutter_application_1/widget/widget_social_google.dart';
import '../../widget/widget_form.dart';
import '../../firebase/firebase_auth.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _senhaController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();
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
      body: _getBody(context, _authService),
      backgroundColor: backgroundColor,
    );
  }

  Widget _getBody(BuildContext context, AuthService _authService) {
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
                  texFormField(
                    label: 'Email',
                    icon: Icons.email_outlined,
                    controller: _emailController,
                    obscureText: false,
                  ),
                  const SizedBox(height: 49),
                  texFormField(
                    label: 'Senha',
                    icon: Icons.key_outlined,
                    controller: _senhaController,
                    obscureText: true,
                  ),
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
              onTap: () async {
                print('Email: ${_emailController.text}');
                try {
                  // Verifique se o email e a senha não estão vazios
                  if (_emailController.text.trim().isEmpty ||
                      _senhaController.text.isEmpty) {
                    _authService.showError(
                        context, 'Por favor, preencha todos os campos.');
                    return;
                  }
                  // Verifique se o email está no formato correto
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                      .hasMatch(_emailController.text.trim())) {
                    _authService.showError(context,
                        'O email fornecido está mal formatado. Verifique se o email está correto e tente novamente.');
                    return;
                  }
                  User? user = await _authService.signIn(
                    email: _emailController.text.trim(),
                    password: _senhaController.text,
                  );
                  if (user != null) {
                    Navigator.pushReplacementNamed(context, 'TelaInicio');
                  } else {
                    _authService.showError(context, 'Erro ao fazer login');
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    _authService.showError(
                        context, 'Nenhum usuário encontrado para esse e-mail.');
                  } else if (e.code == 'wrong-password') {
                    _authService.showError(
                        context, 'Senha errada fornecida para esse usuário.');
                  } else if (e.code == 'invalid-email') {
                    _authService.showError(context,
                        'O email fornecido está mal formatado. Verifique se o email está correto e tente novamente.');
                  }
                }
              },
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
            ),
          ],
        ),
      ),
    );
  }
}
