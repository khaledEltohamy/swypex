import 'package:flutter/material.dart';
import 'package:swypex/core/compounand/text/text_app.dart';

class ButtonApp extends StatelessWidget {
  final Color? color;
  final String title;
  final Color? titleColor;
  final double minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;
  final double? elevation;
  final Function() onTap;
  final Widget? child;
  const ButtonApp({
    super.key,
    this.color,
    required this.title,
    this.titleColor,
    required this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.elevation,
    required this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: color ?? Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          constraints: BoxConstraints(
              minWidth: minWidth,
              maxWidth: maxWidth ?? double.infinity,
              minHeight: minHeight ?? 42,
              maxHeight: maxHeight ?? 54),
          child: Center(
            child: child ??
                TextApp(
                  text: title,
                  size: 20,
                  textColor: titleColor,
                  maxSize: 24,
                ),
          )),
    );
  }
}

class ButtonIcon extends ButtonApp {
  ButtonIcon(
      {required super.title,
      required super.minWidth,
      required super.onTap,
      required super.child,
      super.maxWidth});
  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}
