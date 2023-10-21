import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/colors.dart';

Container elevatedButtonSocialGoogle({required String label, IconData? icon}) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    width: 242,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        disabledForegroundColor:
            const Color.fromARGB(255, 54, 54, 54).withOpacity(0.40),
        elevation: 15,
        shadowColor: primaryColor,
      ),
      child: Row(children: [
        const ImageIcon(
          AssetImage('asset/icons/google.png'),
          size: 10,
        ),
        Text(label,
            style: const TextStyle(
                fontSize: 18, color: TextColor, fontWeight: FontWeight.w500)),
      ]),
      onPressed: () {},
    ),
  );
}
