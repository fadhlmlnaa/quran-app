import 'package:flutter/material.dart';
import 'package:quranku/utils/utils.dart';

class HexagonWidget extends StatelessWidget {
  final double size;
  final Color color;
  final String text;
  final double? strokeWidth;

  // Konstruktor untuk menyesuaikan ukuran dan warna
  const HexagonWidget({
    super.key,
    this.size = 100.0,
    this.color = Colors.white,
    required this.text,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    final color = isLightMode ? primaryColor : secondaryColor;
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(size, size), // Ukuran hexagon
          painter: HexagonPainter(color),
        ), // Menyertakan warna sebagai parameter
        TextWidget(
            text: text,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
            align: TextAlign.center),
      ],
    );
  }
}

class HexagonPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  HexagonPainter(this.color, {this.strokeWidth = 2.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color // Menggunakan warna yang diberikan
      ..style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;

    Path path = Path();

    // Menggambar bentuk hexagon
    path.moveTo(size.width * 0.5, 0); // Titik atas
    path.lineTo(size.width, size.height * 0.25); // Titik kanan atas
    path.lineTo(size.width, size.height * 0.75); // Titik kanan bawah
    path.lineTo(size.width * 0.5, size.height); // Titik bawah
    path.lineTo(0, size.height * 0.75); // Titik kiri bawah
    path.lineTo(0, size.height * 0.25); // Titik kiri atas
    path.close(); // Menutup path untuk membentuk hexagon

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // Tidak perlu repaint
  }
}
