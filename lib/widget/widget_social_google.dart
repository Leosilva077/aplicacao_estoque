import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/colors.dart';

SizedBox elevatedButtonSocialGoogle({
  required IconData icon,
  required String text,
  required Color color,
  required MaterialStateProperty<Color> secundaryColor,
}) {
  return SizedBox(
    width: 242,
    height: 54,
    child: ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: secundaryColor,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      child: Row(children: [
        const SizedBox(
          width: 15,
        ),
        Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 15, color: TextColor, fontWeight: FontWeight.w500),
          ),
        )
      ]),
    ),
  );
}
