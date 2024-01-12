// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; // Importe o pacote de material do Flutter

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Método para registrar um novo usuário
  Future<User?> signUp(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Erro ao registrar: ${e.code} - ${e.message}');
      return null;
    }
  }

  // Método para fazer login de um usuário existente
  Future<User?> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Erro ao fazer login: ${e.code} - ${e.message}');
      return null;
    }
  }

  // Método para mostrar um SnackBar com a mensagem de erro
  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
