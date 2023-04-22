import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class Stars extends StatelessWidget {
  const Stars({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Stack(
                children: List.generate(
                  100,
                  (index) => Positioned(
                    left: Random().nextDouble() * Get.width,
                    top: Random().nextDouble() * Get.height,
                    child: Icon(
                      Icons.star,
                      color: Colors.white.withOpacity(0.5),
                      size: Random().nextDouble() * 6 + 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Stack(
                  children: List.generate(
                      20,
                      (index) => Positioned(
                            left: Random().nextDouble() * Get.width,
                            top: Random().nextDouble() * Get.height / 2,
                            child: SvgPicture.asset(
                                colorFilter: const ColorFilter.mode(
                                    Color(0xffFFDF2E), BlendMode.srcIn),
                                'assets/shooting_star.svg'),
                          ))),
            ),
          ),
        )
      ],
    );
  }
}

class StarsPainter extends CustomPainter {
  final int starCount;
  final double starSize;
  final double starOpacity;
  final double animationValue;

  StarsPainter({
    this.starCount = 50,
    this.starSize = 2.0,
    this.starOpacity = 0.5,
    this.animationValue = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random();
    final paint = Paint()
      ..color = Colors.white.withOpacity(starOpacity)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < starCount; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * starSize;
      final opacity = (random.nextDouble() * 0.5 + 0.5) * starOpacity;
      final starPaint = paint..color = paint.color.withOpacity(opacity);

      canvas.drawCircle(
        Offset(x, y),
        radius,
        starPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
