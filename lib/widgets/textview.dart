import 'package:car_blog/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class Textview extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final bool isBold;
  final TextAlign textAlign;
  const Textview({
    super.key,
    required this.text,
    this.isBold = false,
    this.size = 16,
    this.color = AppColors.blackColor,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isBold ? FontWeight.w800 : FontWeight.normal,
      ),
    );
  }
}
