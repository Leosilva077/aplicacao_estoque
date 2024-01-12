// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screens/telaHome/home.dart';
import 'package:intl/intl.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _formKeyProduct = GlobalKey<FormState>(); // Nova GlobalKey
  final codigoController = TextEditingController();
  final nomeController = TextEditingController();
  final descricaoController = TextEditingController();
  String? categoriaSelecionada;
  final loteController = TextEditingController();
  final quantidadeController = TextEditingController();
  final dataFabricacaoController = TextEditingController();
  final dataVencimentoController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> sendData() async {
    await FirebaseFirestore.instance
        .collection('produtos')
        .doc(codigoController.text)
        .set({
      'nome': nomeController.text,
      'descricao': descricaoController.text,
      'categoria': categoriaSelecionada,
      'lote': loteController.text,
      'quantidade': quantidadeController.text,
      'dataFabricacao': dataFabricacaoController.text,
      'dataVencimento': dataVencimentoController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro de Produtos',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[200],
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 35,
        ),
      ),
      body: SingleChildScrollView(child: _getBody()),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _getBody() {
    return SafeArea(
        child: Column(children: [
      Form(
        key: _formKeyProduct, // Use a nova GlobalKey aqui
        child: Column(
          children: [
            SizedBox(
              width: 360,
              height: 50,
              child: TextFormField(
                controller: codigoController,
                decoration: const InputDecoration(
                  label: Text(
                    'Código',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(color: Colors.black)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o código do produto';
                  }
                  return null;
                }, // Se valor for fazio ou valor for nulo
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 361,
              height: 50,
              child: TextFormField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                      label: Text(
                        'Nome',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      focusColor: Colors.black,
                      focusedBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome do produto';
                    }
                    return null;
                  }),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
                width: 360,
                height: 50,
                child: TextFormField(
                    controller: descricaoController,
                    decoration: const InputDecoration(
                        label: Text(
                          'Descriçao',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        )))),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 360,
              height: 50,
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  label: Text(
                    'Categoria',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                items: <String>[
                  'Bebidas',
                  'Carnes ',
                  'Doces',
                  'Frutas',
                  'Massas',
                  'Laticínios',
                  'Óleos e gorduras',
                  'Cereais e pães ',
                  'Pescados',
                  'Grãos'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    categoriaSelecionada = newValue;
                  });
                },
                value: categoriaSelecionada,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 360,
              height: 50,
              child: TextFormField(
                controller: loteController,
                decoration: const InputDecoration(
                  label: Text(
                    'Lote',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  focusColor: Colors.black,
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 60,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        label: Text(
                          'Data de fabricação',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        )),
                    controller: TextEditingController()
                      ..text = DateFormat('yyyy-MM-dd').format(selectedDate),
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null && picked != selectedDate) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a data de fabricação';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 100,
                  height: 60,
                  child: TextFormField(
                    controller: quantidadeController,
                    decoration: const InputDecoration(
                      label: Text(
                        'Qtd',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      focusColor: Colors.black,
                      focusedBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                SizedBox(
                  width: 100,
                  height: 60,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        label: Text(
                          'Data de vencimento',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        )),
                    controller: TextEditingController()
                      ..text = DateFormat('yyyy-MM-dd').format(selectedDate),
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null && picked != selectedDate) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a data de fabricação';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Container(
              width: 170,
              height: 45,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKeyProduct.currentState!.validate()) {
                    // Salva os dados no Firestore
                    await sendData();

                    // Navega para a tela inicial
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeApp()),
                    );
                  }
                },
                child: const Text('Cadastrar'),
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
