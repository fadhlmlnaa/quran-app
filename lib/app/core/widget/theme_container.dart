import 'package:flutter/material.dart';
import 'package:quranku/app/core/core.dart';

class TContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final BoxBorder? border;
  final BorderRadius? borderRadius;

  const TContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.border,
    this.borderRadius,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    // Menentukan warna gradien berdasarkan tema
    List<Color> gradientColors;
    if (Theme.of(context).brightness == Brightness.light) {
      // Gradien untuk mode terang
      gradientColors = [primaryColor, primaryLightColor];
    } else {
      // Gradien untuk mode gelap
      gradientColors = [secondaryColor, secondaryLightColor];
    }

    return Container(
      height: height, // Dapat diatur sesuai keinginan
      width: width, // Dapat diatur sesuai keinginan
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: border,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
