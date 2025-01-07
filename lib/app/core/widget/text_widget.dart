import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign align;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fontFamily;
  final FontStyle? fontstyle;
  const TextWidget({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    this.color,
    this.align = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.fontFamily,
    this.fontstyle,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor;
    if (fontSize <= 16) {
      textColor = Theme.of(context).textTheme.labelMedium!.color!;
    } else {
      textColor = Theme.of(context).textTheme.labelLarge!.color!;
    }
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? textColor,
        fontFamily: 'Poppins',
        decoration: TextDecoration.none,
        fontStyle: fontstyle,
      ),
      textAlign: align,
    );
  }
}
