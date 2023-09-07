
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Product {
  String code;
  String name;
  int quantity;
  String lot;
  DateTime? expirationDate; // Alterado para DateTime? para permitir valores nulos
  String description;

  Product(this.code, this.name, this.quantity, this.lot, this.expirationDate, this.description);
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

  void _addProduct(Product product) {
    setState(() {
      products.add(product);
    });
  }

  void _editProduct(int index, Product product) {
    setState(() {
      products[index] = product;
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
          final product = products[index];

          return ListTile(
            title: Text(product.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Código: ${product.code}'),
                Text('Quantidade: ${product.quantity}'),
                Text('Lote: ${product.lot}'),
                Text('Data de Vencimento: ${product.expirationDate?.toString() ?? 'N/A'}'), // Verificação para exibir 'N/A' se expirationDate for nulo
                Text('Descrição: ${product.description}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    final editedProduct = await showDialog<Product>(
                      context: context,
                      builder: (BuildContext context) {
                        String newName = product.name;
                        String newCode = product.code;
                        int newQuantity = product.quantity;
                        String newLot = product.lot;
                        DateTime? newExpirationDate = product.expirationDate; // Alterado para DateTime?
                        String newDescription = product.description;

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
                                  labelText: 'Código',
                                ),
                                onChanged: (text) {
                                  newCode = text;
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
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Lote',
                                ),
                                onChanged: (text) {
                                  newLot = text;
                                },
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Data de Vencimento (yyyy-MM-dd)',
                                ),
                                onChanged: (text) {
                                  // Converter a data de texto para DateTime
                                  try {
                                    newExpirationDate = DateTime.parse(text);
                                  } catch (e) {
                                    // Lidar com erros de formato de data aqui
                                  }
                                },
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Descrição',
                                ),
                                onChanged: (text) {
                                  newDescription = text;
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
                                Navigator.pop(context, Product(newCode, newName, newQuantity, newLot, newExpirationDate, newDescription));
                              },
                              child: Text('Salvar'),
                            ),
                          ],
                        );
                      },
                    );

                    if (editedProduct != null) {
                      _editProduct(index, editedProduct);
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
          final newProduct = await showDialog<Product>(
            context: context,
            builder: (BuildContext context) {
              String name = '';
              String code = '';
              int quantity = 0;
              String lot = '';
              DateTime? expirationDate; // Alterado para DateTime?
              String description = '';

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
                        labelText: 'Código',
                      ),
                      onChanged: (text) {
                        code = text;
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
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Lote',
                      ),
                      onChanged: (text) {
                        lot = text;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Data de Vencimento (yyyy-MM-dd)',
                      ),
                      onChanged: (text) {
                        // Converter a data de texto para DateTime
                        try {
                          expirationDate = DateTime.parse(text);
                        } catch (e) {
                          // Lidar com erros de formato de data aqui
                        }
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Descrição',
                      ),
                      onChanged: (text) {
                        description = text;
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
                      Navigator.pop(context, Product(code, name, quantity, lot, expirationDate, description));
                    },
                    child: Text('Adicionar'),
                  ),
                ],
              );
            },
          );

          if (newProduct != null) {
            _addProduct(newProduct);
          }
        },
        tooltip: 'Adicionar Produto',
        child: Icon(Icons.add),
      ),
    );
  }
}