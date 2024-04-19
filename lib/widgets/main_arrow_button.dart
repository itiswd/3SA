import 'package:flutter/material.dart';

class MainArrowButton extends StatelessWidget {
  final TextDirection textDirection;
  final IconData icon;
  final String text;
  final Function()? onTap;
  const MainArrowButton({
    super.key,
    required this.icon,
    required this.textDirection,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          textDirection: textDirection,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
