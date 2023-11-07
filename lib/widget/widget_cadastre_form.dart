import 'package:flutter/material.dart';
import '../theme/contants.dart';

SizedBox texForm({
  required String label,
  required IconData icon,
}) {
  return SizedBox(
    width: 340,
    height: 52,
    child: TextFormField(
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: backgroundColor)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10), topLeft: Radius.circular(10)),
            borderSide: BorderSide(color: backgroundColor)),
        labelText: label,
        fillColor: Colors.white,
        labelStyle: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w300, color: backgroundColor),
        prefixIcon: Icon(icon, color: backgroundColor),
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
