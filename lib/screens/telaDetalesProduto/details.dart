import 'package:flutter/material.dart';

class DetailsProduct extends StatelessWidget {
  final Map<String, dynamic> dadosProduto;

  DetailsProduct({required this.dadosProduto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dadosProduto['nome']),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Código: ${dadosProduto['codigo']}'),
            Text('Descrição: ${dadosProduto['descricao']}'),
            Text('Categoria: ${dadosProduto['categoria']}'),
            Text('Lote: ${dadosProduto['lote']}'),
            Text('Quantidade: ${dadosProduto['quantidade']}'),
            Text('Data de Fabricação: ${dadosProduto['dataFabricacao']}'),
            Text('Data de Vencimento: ${dadosProduto['dataVencimento']}'),
          ],
        ),
      ),
    );
  }
}
