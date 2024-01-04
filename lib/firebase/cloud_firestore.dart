import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDb extends StatefulWidget {
  const FirestoreDb({super.key});

  @override
  _MeuWidgetState createState() => _MeuWidgetState();
}

class _MeuWidgetState extends State<FirestoreDb> {
  final _meuDadoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo Firestore')),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _meuDadoController,
            decoration: const InputDecoration(labelText: 'Insira um dado'),
          ),
          ElevatedButton(
            child: const Text('Salvar no Firestore'),
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
                return const Text("Algo deu errado");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Text("Dado recuperado: ${data['meuDado']}");
              }

              return const Text("Carregando");
            },
          ),
        ],
      ),
    );
  }
}
