import 'package:flutter/material.dart';
import '../theme/consts.dart';

SizedBox texForm({
  required String label,
  required IconData icon,
  required Null Function(dynamic value) onChanged,
  required bool obscureText,
  IconButton? suffixIcon,
  required TextEditingController controller,
  required String? Function(dynamic value) validator,
}) {
  return SizedBox(
    width: 340,
    height: 52,
    child: TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
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
        suffixIcon: suffixIcon,
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
