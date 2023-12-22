import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/contants.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.ref();

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  final codigoController = TextEditingController();
  final nomeController = TextEditingController();
  final descricaoController = TextEditingController();
  final categoriaController = TextEditingController();
  final loteController = TextEditingController();
  final dataFabricacaoController = TextEditingController();
  final quantidadeController = TextEditingController();
  final dataVencimentoController = TextEditingController();

  void sendData() {
    databaseReference.child("Produtos").set({
      'codigo': codigoController.text,
      'nome': nomeController.text,
      'descricao': descricaoController.text,
      'categoria': categoriaController.text,
      'lote': loteController.text,
      'dataFabricacao': dataFabricacaoController.text,
      'quantidade': quantidadeController.text,
      'dataVencimento': dataVencimentoController.text
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
        backgroundColor: secondaryColor,
        leading: const Icon(
          Icons.arrow_back,
          color: primaryColor,
          size: 35,
        ),
      ),
      body: SingleChildScrollView(child: _getBody()),
      backgroundColor: secondaryColor,
    );
  }

  Widget _getBody() {
    return SafeArea(
        child: Column(children: [
      Form(
        key: _formKey,
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
            const SizedBox(
                width: 360,
                height: 50,
                child: TextField(
                    decoration: InputDecoration(
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
                onChanged: (String? newValue) {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 360,
              height: 50,
              child: TextFormField(
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
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
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
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 100,
                  height: 60,
                  child: TextFormField(
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
                SizedBox(
                  width: 10,
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
                const SizedBox(width: 70),
              ],
            ),
            Container(
              width: 170,
              height: 45,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendData();
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
