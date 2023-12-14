import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/contants.dart';

class CategoriaScreen extends StatefulWidget {
  const CategoriaScreen({super.key});

  @override
  State<CategoriaScreen> createState() => _CategoriaScreenState();
}

class _CategoriaScreenState extends State<CategoriaScreen> {
  // Adicionando uma lista de caminhos de imagem
  final List<String> imagePaths = [
    'asset/icon/bebidas.png',
    'asset/icon/carnes.png',
    'asset/icon/cereais_paes.png',
    'asset/icon/doces.png',
    'asset/icon/frutas.png',
    'asset/icon/graos.png',
    'asset/icon/aticinios.png',
    'asset/icon/massas.png',
    'asset/icon/oleos_gorduras.png',
    'asset/icon/pescados.png',
  ];

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
      child: Center(
        child: Column(
          children: List.generate(5, (index) => _buildRow(index)),
        ),
      ),
    );
  }

  Widget _buildRow(int rowIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildContainer(imagePaths[rowIndex * 2], 'Texto ${rowIndex * 2 + 1}'),
        const SizedBox(width: 20), // Espaço entre os Containers
        _buildContainer(
            imagePaths[rowIndex * 2 + 1], 'Texto ${rowIndex * 2 + 2}'),
      ],
    );
  }

  Widget _buildContainer(String imagePath, String text) {
    return GestureDetector(
      onTap: () {
        print('Container $text clicado');
      },
      child: Container(
        height: 100, // ajuste a altura conforme necessário
        width: 100, // ajuste a largura conforme necessário
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
