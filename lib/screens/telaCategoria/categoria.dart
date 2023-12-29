import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/consts.dart';

class CategoriaScreen extends StatefulWidget {
  const CategoriaScreen({super.key});

  @override
  State<CategoriaScreen> createState() => _CategoriaScreenState();
}

class _CategoriaScreenState extends State<CategoriaScreen> {
  final List<String> imagePaths = [
    'assets/icon/bebidas.png',
    'assets/icon/carnes.png',
    'assets/icon/cereais_paes.png',
    'assets/icon/doces.png',
    'assets/icon/frutas.png',
    'assets/icon/graos.png',
    'assets/icon/aticinios.png',
    'assets/icon/massas.png',
    'assets/icon/oleos_gorduras.png',
    'assets/icon/pescados.png',
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
          children: [
            const Text(
              'Categoria',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ...List.generate(
                imagePaths.length ~/ 2, (index) => _buildRow(index)),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(int rowIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildContainer(imagePaths[rowIndex * 2], 'Texto ${rowIndex * 2 + 1}'),
        const SizedBox(width: 20),
        if (rowIndex * 2 + 1 < imagePaths.length)
          _buildContainer(
              imagePaths[rowIndex * 2 + 1], 'Texto ${rowIndex * 2 + 2}'),
      ],
    );
  }

  Widget _buildContainer(String imagePath, String text) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 100,
        width: 100,
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
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
