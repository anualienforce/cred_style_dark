import 'package:flutter/material.dart';

class AnimatedDotIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double spacing;
  final double animationValue;

  const AnimatedDotIndicator({
    super.key,
    required this.currentIndex,
    required this.itemCount,
    this.activeColor = const Color(0xFF00FFD1),
    this.inactiveColor = const Color(0xFF4A4A4A),
    this.dotSize = 8.0,
    this.spacing = 8.0,
    this.animationValue = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: index == currentIndex ? dotSize * 2 : dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: index == currentIndex ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(dotSize / 2),
            boxShadow: index == currentIndex
                ? [
              BoxShadow(
                color: activeColor.withOpacity(0.4),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ]
                : null,
          ),
          child: index == currentIndex
              ? AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  activeColor.withOpacity(0.8),
                  activeColor,
                ],
              ),
              borderRadius: BorderRadius.circular(dotSize / 2),
            ),
          )
              : null,
        ),
      ),
    );
  }
}