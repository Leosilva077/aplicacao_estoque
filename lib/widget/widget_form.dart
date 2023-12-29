import 'package:flutter/material.dart';
import '../theme/consts.dart';

Container texFormField(
    {required String label, required IconData icon, BorderSide? borderSide}) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
    width: 340,
    height: 52,
    child: TextFormField(
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.white,
        labelStyle: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w300, color: primaryColor),
        prefixIcon: Icon(icon, color: primaryColor),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
    ),
  );
}
