import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/consts.dart';
import 'package:flutter_application_1/widget/widget_cadastre_form.dart';
import 'package:flutter_application_1/widget/widget_social_google.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../firebase/firebase_auth.dart';
import '../../widget/widget_social_Apple.dart';

final TextEditingController _nomeController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _senhaController = TextEditingController();
final TextEditingController _confirmarSenhaController = TextEditingController();

class CadastreScreen extends StatefulWidget {
  const CadastreScreen({super.key});

  @override
  State<CadastreScreen> createState() => _CadastreState();
}

class _CadastreState extends State<CadastreScreen> {
  final AuthService _authService = AuthService();

  bool _obscureText = true;
  bool _obscureTextConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: secondaryColor,
        leading: const Icon(
          Icons.arrow_back,
          color: primaryColor,
          size: 35,
        ),
      ),
      body: _getBody(),
      backgroundColor: secondaryColor,
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
              Text('Faça o cadastro para ter acesso ao aplicativo',
                  style: TextStyle(color: backgroundColor)),
            ],
          ),
          const SizedBox(height: 25),
          Column(
            children: [
              Form(
                  child: Column(
                children: [
                  texForm(
                    label: 'Nome',
                    icon: Icons.person,
                    controller: _nomeController,
                    onChanged: (value) {
                      setState(() {
                        _nomeController.text = value.trim();
                      });
                    },
                    obscureText: false,
                    validator: (value) {},
                  ),
                  const SizedBox(height: 15),
                  texForm(
                    label: 'Email',
                    icon: Icons.email,
                    controller: _emailController,
                    onChanged: (value) {
                      setState(() {
                        _emailController.text = value.trim();
                      });
                    },
                    obscureText: false,
                    validator: (value) {},
                  ),
                  const SizedBox(height: 15),
                  texForm(
                    label: 'Senha',
                    icon: Icons.lock,
                    controller: _senhaController,
                    obscureText: _obscureText,
                    onChanged: (value) {
                      setState(() {
                        _senhaController.text = value.trim();
                      });
                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    validator: (value) {},
                  ),
                  const SizedBox(height: 15),
                  texForm(
                    label: 'Confirmar Senha',
                    icon: Icons.lock,
                    controller: _confirmarSenhaController,
                    obscureText: _obscureTextConfirm,
                    onChanged: (value) {
                      setState(() {
                        _confirmarSenhaController.text = value.trim();
                      });
                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureTextConfirm
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureTextConfirm = !_obscureTextConfirm;
                        });
                      },
                    ),
                    validator: (value) {},
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColor),
                    onPressed: () async {
                      print('Email: ${_emailController.text}');
                      String nome = _nomeController.text.trim();
                      String email = _emailController.text.trim();
                      String senha = _senhaController.text.trim();
                      String confirmarSenha =
                          _confirmarSenhaController.text.trim();

                      if (nome.isEmpty) {
                        _authService.showError(
                            context, 'O campo de nome está vazio');
                      } else if (email.isEmpty) {
                        _authService.showError(
                            context, 'O campo de e-mail está vazio');
                      } else if (senha.isEmpty) {
                        _authService.showError(
                            context, 'O campo de senha está vazio');
                      } else if (confirmarSenha.isEmpty) {
                        _authService.showError(
                            context, 'O campo de confirmar senha está vazio');
                      } else if (senha == confirmarSenha) {
                        try {
                          User? user = await _authService.signUp(
                            email: email,
                            password: senha,
                          );
                          if (user != null) {
                            Navigator.pushReplacementNamed(
                                context, 'TelaInicio');
                          } else {
                            _authService.showError(
                                context, 'Erro ao registrar');
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'email-already-in-use') {
                            _authService.showError(
                                context, 'O e-mail já está em uso');
                          }
                        } catch (e) {
                          print(e);
                        }
                      } else {
                        _authService.showError(
                            context, 'As senhas não correspondem');
                      }
                    },
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(
                        fontSize: 18,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    '-------OU-------',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 40),
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
                ],
              ))
            ],
          )
        ],
      ),
    ));
  }
}
