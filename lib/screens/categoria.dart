import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/contants.dart';

class CategoriaScreen extends StatefulWidget {
  const CategoriaScreen({super.key});

  @override
  State<CategoriaScreen> createState() => _CategoriaScreenState();
}

class _CategoriaScreenState extends State<CategoriaScreen> {
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
    return const SafeArea(
        child: Center(
      child: Column(
        children: [
          Text(
            'Categoria',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    ));
  }
}
