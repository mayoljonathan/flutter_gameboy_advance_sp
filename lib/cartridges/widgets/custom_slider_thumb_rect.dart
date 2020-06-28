import 'package:flutter/material.dart';

class CustomSliderThumbRect extends SliderComponentShape {
  final double thumbHeight;
  final Color thumbColor;

  const CustomSliderThumbRect({
    this.thumbHeight = 24,
    @required this.thumbColor,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
    double textScaleFactor,
    Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final rRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: thumbHeight * 0.2, height: thumbHeight * .8),
      Radius.circular(24 * .4),
    );

    final paint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(rRect, paint);
  }
}
