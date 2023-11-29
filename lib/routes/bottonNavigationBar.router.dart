import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cadastrar_produto.dart';
import 'package:flutter_application_1/screens/categoria.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/profile.dart';
import 'package:flutter_application_1/theme/contants.dart';

class BottonNavigatioRender extends StatelessWidget {
  const BottonNavigatioRender({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BarNavigator(),
    );
  }
}

class BarNavigator extends StatefulWidget {
  const BarNavigator({super.key});

  @override
  State<BarNavigator> createState() => _BarNavigatorState();
}

class _BarNavigatorState extends State<BarNavigator> {
  int _selectedIndex = 0;
  static const List<Widget> _widgets = <Widget>[
    HomeApp(),
    CategoriaScreen(),
    ProfileScrenn(),
    ProductScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgets.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.green,
        ),
        child: BottomNavigationBar(
          iconSize: 35,
          showSelectedLabels: false,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: primaryColor,
              ),
              label: '',
              backgroundColor: Colors.green,
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.category, color: primaryColor),
              label: '',
              backgroundColor: Colors.green,
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person, color: primaryColor),
              label: '',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(150),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(Icons.add, color: Colors.black),
              ),
              label: '',
              backgroundColor: Colors.green,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
