import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MeuWidget extends StatefulWidget {
  @override
  _MeuWidgetState createState() => _MeuWidgetState();
}

class _MeuWidgetState extends State<MeuWidget> {
  final _meuDadoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo Firestore')),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _meuDadoController,
            decoration: InputDecoration(labelText: 'Insira um dado'),
          ),
          ElevatedButton(
            child: Text('Salvar no Firestore'),
            onPressed: () async {
              // Passo 4: Salvar dados no Firestore
              await FirebaseFirestore.instance.collection('minhaColecao').add({
                'meuDado': _meuDadoController.text,
              });
            },
          ),
          FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('minhaColecao')
                .doc('meuDocumento')
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Algo deu errado");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Text("Dado recuperado: ${data['meuDado']}");
              }

              return Text("Carregando");
            },
          ),
        ],
      ),
    );
  }
}
