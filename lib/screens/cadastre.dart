import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/colors.dart';

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
        Form(
            child: Column(
          children: [TextFormField()],
        ))
      ],
    ));
  }
}
