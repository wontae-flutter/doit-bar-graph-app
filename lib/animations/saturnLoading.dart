import 'package:flutter/material.dart';
import 'dart:math';

class SaturnLoading extends StatefulWidget {
  const SaturnLoading({super.key});

  @override
  State<SaturnLoading> createState() => _SaturnLoadingState();
}

class _SaturnLoadingState extends State<SaturnLoading>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation =
        Tween<double>(begin: 0, end: pi * 2).animate(_animationController!);
    _animationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return Container(
          child: Stack(
            children: [
              Image.asset(
                "assets/images/circle.png",
                width: 100,
                height: 100,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}
