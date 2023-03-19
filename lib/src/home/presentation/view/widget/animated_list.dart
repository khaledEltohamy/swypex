import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListWidget extends StatelessWidget {
  final List<Widget> childern;
  final double? top;
  final double? bottom;
  const AnimatedListWidget(
      {super.key, required this.childern, this.top, this.bottom});

  @override
  Widget build(BuildContext context) {
    return _pageView(context);
  }

  Widget _pageView(context) {
    return SingleChildScrollView(
      child: AnimationLimiter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 1000),
                childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                children: childern),
          ),
        ),
      ),
    );
  }
}
