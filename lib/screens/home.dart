import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      backgroundColor: Colors.black,
    );
  }

  Widget _getBody() {
    return const SafeArea(
      child: Column(),
    );
  }
}
