import 'package:sssa/data/colors.dart';
import 'package:flutter/material.dart';

class MainTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;

  const MainTextFormField({
    super.key,
    this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appbarColor,
      surfaceTintColor: appbarColor,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(48),
        ),
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12.0),
          labelText: labelText,
          hintStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 20,
          ),
          labelStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 20,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
