import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ScrollReveal extends StatelessWidget {
  const ScrollReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  final Widget child;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return child
        .animate()
        .fadeIn(duration: 450.ms, delay: delay, curve: Curves.easeOut)
        .slideY(
          begin: 0.06,
          end: 0,
          duration: 450.ms,
          delay: delay,
          curve: Curves.easeOut,
        );
  }
}
