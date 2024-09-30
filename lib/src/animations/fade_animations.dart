import 'package:flutter/material.dart';

class FadeAnimations extends StatelessWidget {
  const FadeAnimations({super.key, required this.child,
  this.begin=0, this.end=1, this.intervalstart=0,
  this.intervalend=1, this.duration=const Duration(milliseconds: 3000),
  this.curve=Curves.fastOutSlowIn});

  final double begin;
  final double end;
  final Duration duration;
  final double intervalstart;
  final double intervalend;
  final Curve curve;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: begin, end: end),
      duration: duration,
      curve: Interval(intervalstart, intervalend, curve: curve),
      child: child,
      builder: (BuildContext context, double value,
      Widget? child){
        return Opacity(opacity: value,
        child: child,);
      },
      );
  }
}