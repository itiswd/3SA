import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color color;
  final double? width;
  final double? height;
  const MainButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        color: color,
        minWidth: width,
        height: height,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
