import 'package:flutter/material.dart';

class WideIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _WideIndicatorPainter(this, onChanged);
  }
}

class _WideIndicatorPainter extends BoxPainter {
  final WideIndicator decoration;

  _WideIndicatorPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    // Indicator width (make big)
    double indicatorWidth = cfg.size!.width * 0.7; // 70% of tab width

    // Center indicator under tab
    final double startX = offset.dx + (cfg.size!.width - indicatorWidth) / 2;
    final double endX = startX + indicatorWidth;

    final double y = offset.dy + cfg.size!.height - 5;

    canvas.drawLine(Offset(startX, y), Offset(endX, y), paint);
  }
}
