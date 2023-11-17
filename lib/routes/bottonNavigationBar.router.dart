import 'package:flutter/material.dart';
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
    Categoria(),
    ProfileScrenn(),
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
      bottomNavigationBar: _getBottonNavigationBar(),
    );
  }

  BottomNavigationBar _getBottonNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: backgroundColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: primaryColor,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.category_outlined,
              color: primaryColor,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: primaryColor,
            ),
            label: '')
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
