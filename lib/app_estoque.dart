import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Product {
  String name;
  int quantity;

  Product(this.name, this.quantity);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Estoque Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StockList(),
    );
  }
}

class StockList extends StatefulWidget {
  @override
  _StockListState createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  List<Product> products = [];

  void _addProduct(String name, int quantity) {
    setState(() {
      products.add(Product(name, quantity));
    });
  }

  void _editProduct(int index, String name, int quantity) {
    setState(() {
      products[index].name = name;
      products[index].quantity = quantity;
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Estoque Flutter'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('Quantidade: ${products[index].quantity}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    final editedProduct =
                        await showDialog<Map<String, dynamic>>(
                      context: context,
                      builder: (BuildContext context) {
                        String newName = products[index].name;
                        int newQuantity = products[index].quantity;

                        return AlertDialog(
                          title: Text('Editar Produto'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Nome',
                                ),
                                onChanged: (text) {
                                  newName = text;
                                },
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Quantidade',
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (text) {
                                  newQuantity = int.tryParse(text) ?? 0;
                                },
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancelar'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, {
                                  'name': newName,
                                  'quantity': newQuantity,
                                });
                              },
                              child: Text('Salvar'),
                            ),
                          ],
                        );
                      },
                    );

                    if (editedProduct != null) {
                      _editProduct(index, editedProduct['name'],
                          editedProduct['quantity']);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteProduct(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newProduct = await showDialog<Map<String, dynamic>>(
            context: context,
            builder: (BuildContext context) {
              String name = '';
              int quantity = 0;

              return AlertDialog(
                title: Text('Adicionar Produto'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nome',
                      ),
                      onChanged: (text) {
                        name = text;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Quantidade',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        quantity = int.tryParse(text) ?? 0;
                      },
                    ),
                  ],
                ),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, {
                        'name': name,
                        'quantity': quantity,
                      });
                    },
                    child: Text('Adicionar'),
                  ),
                ],
              );
            },
          );

          if (newProduct != null) {
            _addProduct(newProduct['name'], newProduct['quantity']);
          }
        },
        tooltip: 'Adicionar Produto',
        child: Icon(Icons.add),
      ),
    );
  }
}
