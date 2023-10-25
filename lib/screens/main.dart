import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cadastre.dart';
import 'package:flutter_application_1/screens/categoria.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/welcome.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    ));

    
/*Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),*/