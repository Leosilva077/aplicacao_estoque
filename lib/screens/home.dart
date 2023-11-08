import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/contants.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Center(
              child: Text("Home"),
            ),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: new Icon(
              Icons.add_outlined,
              color: primaryColor,
            ),
            backgroundColor: backgroundColor,
            onPressed: () {}));
  }
}
