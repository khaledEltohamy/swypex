import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:swypex/core/compounand/text/text_app.dart';

class LoadingTextWidget extends StatelessWidget {
  final Color? color;
  final double? size;
  final Color? textColor;
  final bool withText;
  const LoadingTextWidget(
      {super.key,
      this.color,
      this.size,
      this.textColor,
      required this.withText});

  @override
  Widget build(BuildContext context) {
    return withText
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: LoadingAnimationWidget.waveDots(
                  size: size ?? 20,
                  color: color ?? Colors.blue,
                ),
              ),
              TextApp(
                text: "تحميل",
                textColor: Colors.blue,
                fontWeight: FontWeight.w500,
                size: 16,
              ),
            ],
          )
        : Center(
            child: LoadingAnimationWidget.waveDots(
              size: size ?? 40,
              color: color ?? Colors.white,
            ),
          );
  }
}
