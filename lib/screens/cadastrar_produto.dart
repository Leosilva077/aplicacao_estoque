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
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black)),
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
  return SafeArea(
      child: Column(children: [
    Form(
      child: Column(
        children: [
          SizedBox(
            width: 360,
            height: 50,
            child: TextFormField(
              decoration: const InputDecoration(
                label: Text(
                  'Codigo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                focusColor: Colors.black,
                focusedBorder: OutlineInputBorder(),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: BorderSide(color: Colors.black)),
              ),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))))),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 130,
                height: 60,
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      'Qtd',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              SizedBox(
                  width: 130,
                  height: 60,
                  child: TextFormField(
                      decoration: const InputDecoration(
                          label: Text(
                            'Lote',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          focusColor: Colors.black,
                          focusedBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ))))
            ],
          ),
          Container(
              width: 361,
              height: 50,
              child: TextField(
                  decoration: const InputDecoration(
                      label: Text(
                        'Categoria',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      focusColor: Colors.black,
                      focusedBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      )))),
          Container(
              width: 361,
              height: 50,
              child: TextField(
                  decoration: const InputDecoration(
                      label: Text(
                        'Data de vencimento',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      focusColor: Colors.black,
                      focusedBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ))))
        ],
      ),
    ),
  ]));
}
