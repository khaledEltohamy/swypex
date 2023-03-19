import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../button/button_app.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;
  const LoadingWidget({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeRotatingDots(
        size: size ?? 40,
        color: color ?? Colors.white,
      ),
    );
  }
}

class LoadingCycleWidget extends StatelessWidget {
  final double? width;
  final double? heigth;
  const LoadingCycleWidget({super.key, this.width, this.heigth});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width ?? 60,
        height: heigth ?? 60,
        decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: const LoadingWidget(),
      ),
    );
  }
}

class ButtonLoading extends StatelessWidget {
  final String title;
  const ButtonLoading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonApp(
          minWidth: 50,
          maxWidth: 80,
          minHeight: 42,
          maxHeight: 52,
          title: title,
          child: LoadingWidget(),
          onTap: () {}),
    );
  }
}
