import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/colors.dart';

Container elevatedButtonSocialApple({required String label, IconData? icon}) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    width: 224,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        disabledForegroundColor: Colors.red.withOpacity(0.40),
        elevation: 15,
        shadowColor: primaryColor,
      ),
      child: Text(label,
          style: const TextStyle(
              fontSize: 18,
              color: secondaryColor,
              fontWeight: FontWeight.w500)),
      onPressed: () {},
    ),
  );
}
