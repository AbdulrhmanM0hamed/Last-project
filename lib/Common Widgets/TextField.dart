import 'package:doctor_app/Common/Color_extentions.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required this.ispass,
    required this.Labeltext,
  });

  final bool ispass;
  final String Labeltext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: TextStyle(color: TColor.white),
        decoration: InputDecoration(
            labelText: "$Labeltext",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: TColor.primary)),
            hintStyle: TextStyle(color: TColor.gray)),
        obscureText: ispass,
      ),
    );
  }
}
