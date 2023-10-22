import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/colors.dart';

SizedBox elevatedButtonSocialApple({
  required IconData icon,
  required String text,
  required Color color,
  required MaterialStateProperty<Color> prymaryColor,
}) {
  return SizedBox(
    width: 200,
    height: 50,
    child: ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: prymaryColor,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      child: Row(children: [
        Icon(
          icon,
          size: 24,
        ),
        const SizedBox(
          width: 15,
        ),
        Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 15,
                color: secondaryColor,
                fontWeight: FontWeight.w500),
          ),
        )
      ]),
    ),
  );
}
