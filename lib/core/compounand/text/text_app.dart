import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? size;
  final double? maxSize;
  const TextApp(
      {super.key,
      required this.text,
      this.textColor,
      this.fontWeight,
      this.size,
      this.maxSize});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: 1,
      maxFontSize: maxSize ?? 20,
      minFontSize: size ?? 12,
      style: TextStyle(
        color: textColor ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.w900,
      ),
    );
  }
}
