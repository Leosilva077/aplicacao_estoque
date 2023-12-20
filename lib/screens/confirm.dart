import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/contants.dart';
import 'package:flutter_application_1/widget/widget_cadastre_form.dart';

class ConfirmacaoScreen extends StatefulWidget {
  const ConfirmacaoScreen({super.key});

  @override
  State<ConfirmacaoScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ConfirmacaoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: secondaryColor,
        leading: const Icon(
          Icons.arrow_back,
          color: primaryColor,
          size: 35,
        ),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: Column(children: [
        Form(
          child:
              texForm(label: 'insira sua nova senha', icon: Icons.key_outlined),
        )
      ]),
    );
  }
}
