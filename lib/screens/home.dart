import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/contants.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 170,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 221, 226, 230),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  borderRadius:
                      BorderRadius.circular(15), // Adiciona bordas arredondadas
                ),
                child: TextButton(
                  child: const Text(
                    'Baixo estoque',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 25),
              Container(
                width: 170,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 221, 226, 230),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  child: const Text(
                    'Produtos a vencer',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(45, (index) {
                return const Center(
                  child: Icon(
                    Icons.image,
                    color: linear3,
                    size: 45,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
