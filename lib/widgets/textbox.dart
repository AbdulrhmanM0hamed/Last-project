import 'package:doctor_app/generated/l10n.dart';
import 'package:doctor_app/main.dart';
import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(50)),
      child: TextField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            hintText: S.of(context).search,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 17)),
      ),
    );
  }
}
