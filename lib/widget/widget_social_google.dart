import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/colors.dart';

SizedBox elevatedButtonSocialGoogle({
  required Image child,
  required String text,
  required Color color,
  required MaterialStateProperty<Color> secundaryColor,
}) {
  return SizedBox(
    width: 240,
    height: 54,
    child: ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: secundaryColor,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      child: Row(children: [
        const SizedBox(
          width: 12,
        ),
        child,
        const SizedBox(
          width: 17,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 15, color: TextColor, fontWeight: FontWeight.w500),
        ),
      ]),
    ),
  );
}

class ImageAsset {}
