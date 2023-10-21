import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/colors.dart';

Container elevatedButton({required String label, required IconData icon}) {
  return Container(
    decoration: const BoxDecoration(
      color: tertiaryColor,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    width: 242,
    height: 53,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        disabledForegroundColor: Colors.red.withOpacity(0.38),
        elevation: 15,
        shadowColor: primaryColor,
      ),
      child: Text(
        label,
      ),
      onPressed: () {},
    ),
  );
}
