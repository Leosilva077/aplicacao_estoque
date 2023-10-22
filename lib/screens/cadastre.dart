// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/colors.dart';
import 'package:flutter_application_1/widget/widget_form.dart';

class cadastre extends StatefulWidget {
  const cadastre({super.key});

  @override
  State<cadastre> createState() => _cadastreState();
}

class _cadastreState extends State<cadastre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: secondaryColor,
        leading: const Icon(
          Icons.arrow_back,
          color: primaryColor,
          size: 40,
        ),
      ),
      body: _getBody(),
      backgroundColor: secondaryColor,
    );
  }

  Widget _getBody() {
    return SafeArea(
        child: Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Faça o cadastro para ter acesso ao aplicativo',
                style: TextStyle(color: backgroundColor)),
          ],
        ),
        const SizedBox(height: 15),
        Column(
          children: [
            Form(
                child: texFormField(
              label: 'Nome',
              icon: Icons.person,
            )),
            const SizedBox(height: 15),
            texFormField(label: 'Email', icon: Icons.email_outlined),
            const SizedBox(height: 15),
            texFormField(label: 'Senha', icon: Icons.key_outlined),
            const SizedBox(height: 15),
            texFormField(label: 'Confirmar Senha', icon: Icons.key_outlined),
            const SizedBox(height: 15),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: backgroundColor),
                  onPressed: () {},
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(
                      fontSize: 18,
                      color: secondaryColor,
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ],
    ));
  }
}
