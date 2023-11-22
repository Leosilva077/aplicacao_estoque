import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/contants.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Produtos',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
        centerTitle: true,
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
}

Widget _getBody() {
  return const SafeArea(
      child: Column(
    children: [Form(child: Column())],
  ));
}
