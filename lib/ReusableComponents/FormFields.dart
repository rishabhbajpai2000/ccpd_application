import 'package:flutter/material.dart';

Widget formField({required String Heading, required TextEditingController controller,required bool numericalKeyboard }) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
      Heading,
    ),
    SizedBox(
      height: 5,
    ),
    TextField(
      controller: controller,
      decoration: InputDecoration(),
      keyboardType: numericalKeyboard == true? TextInputType.number:TextInputType.text
    ),
    SizedBox(
      height: 20,
    )
  ]);
}
