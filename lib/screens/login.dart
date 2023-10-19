import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/colors.dart';

import '../widget/widget_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          Row(
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
          SizedBox(height: 76),
          Form(
            child: Column(
              children: [
                texFormField(label: 'Email', icon: Icons.email_outlined),
                SizedBox(height: 49),
                texFormField(label: 'Senha', icon: Icons.key_outlined),
              ],
            ),
          ),
          SizedBox(height: 43),
          GestureDetector(
              onTap: null,
              child: Text(
                'Esqueceu a senha?',
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}
