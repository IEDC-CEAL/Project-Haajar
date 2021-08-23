// A class to custom paint the sign in screen

import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/route_manager.dart';
import 'package:project_haajar/model/sign_in_page/springCurve.dart';

class BackgroundPainter extends CustomPainter {
  //Accessing Palette class constants
  BackgroundPainter({Animation<double> animation})
      : bluePaint = Paint()
          // ..color =  Palette.darkBlue
          ..shader = ui.Gradient.linear(
            Offset(0, 0),
            Offset(Get.size.width / 2, Get.size.height),
            [
              Color(0xff000046),
              Color(0xff1CB5E0),
            ],
          )
          ..style = PaintingStyle.fill,
        greyPaint = Paint()
          // ..color = Palette.darkBlue
          ..shader = ui.Gradient.linear(
            Offset(0, 0),
            Offset(Get.size.width / 2, Get.size.height),
            [
              Color(0xff141E30),
              Color(0xff243B55),
            ],
          )
          ..style = PaintingStyle.fill,
        orangePaint = Paint()
          // ..color = Palette.orange
          ..shader = ui.Gradient.linear(
            Offset(0, 0),
            Offset(Get.size.width / 2, Get.size.height),
            [
              Color(0xffc21500),
              Color(0xffffc500),
            ],
          )
          ..style = PaintingStyle.fill,
        blueAnimation = CurvedAnimation(
            parent: animation,
            curve: const SpringCurve(),
            reverseCurve: Curves.easeInCirc),
        liquidAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.elasticOut,
            reverseCurve: Curves.easeInBack),
        orangeAnimation = CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            0.7,
            curve: Interval(0, 0.8, curve: SpringCurve()),
          ),
          reverseCurve: Curves.linear,
        ),
        greyAnimation = CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            0.8,
            curve: Interval(0, 0.9, curve: SpringCurve()),
          ),
          reverseCurve: Curves.easeInCirc,
        ),
        super(repaint: animation);

  final Paint bluePaint;
  final Paint greyPaint;
  final Paint orangePaint;

  final Animation<double> liquidAnimation;
  final Animation<double> blueAnimation;
  final Animation<double> greyAnimation;
  final Animation<double> orangeAnimation;

  // main method to start Painting process
  @override
  void paint(Canvas canvas, Size size) {
    //debug statement to optimize further
    print("Called Painting");
    paintBlue(canvas, size);
    paintGrey(canvas, size);
    paintOrange(canvas, size);
  }

  // main Drawing and coloring method
  void paintBlue(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, lerpDouble(0, size.height, blueAnimation.value));
    _addPointsToPath(path, [
      Point(lerpDouble(0, size.width / 3, blueAnimation.value),
          lerpDouble(0, size.height, blueAnimation.value)),
      Point(
          lerpDouble(size.width / 2, size.width / 4 * 3, liquidAnimation.value),
          lerpDouble(
              size.height / 2, size.height / 4 * 3, liquidAnimation.value)),
      Point(
          size.width,
          lerpDouble(
              size.height / 2, size.height * 3 / 4, liquidAnimation.value)),
    ]);
    canvas.drawPath(path, bluePaint);
  }

  void paintGrey(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, 300);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(
        size.height / 4,
        size.height / 2,
        greyAnimation.value,
      ),
    );
    _addPointsToPath(
      path,
      [
        Point(
          size.width / 4,
          lerpDouble(
              size.height / 2, size.height * 3 / 4, liquidAnimation.value),
        ),
        Point(
          size.width * 3 / 5,
          lerpDouble(size.height / 4, size.height / 2, liquidAnimation.value),
        ),
        Point(
          size.width * 4 / 5,
          lerpDouble(size.height / 6, size.height / 3, greyAnimation.value),
        ),
        Point(
          size.width,
          lerpDouble(size.height / 5, size.height / 4, greyAnimation.value),
        ),
      ],
    );

    canvas.drawPath(path, greyPaint);
  }

  void paintOrange(Canvas canvas, Size size) {
    if (orangeAnimation.value > 0) {
      final path = Path();

      path.moveTo(size.width * 3 / 4, 0);
      path.lineTo(0, 0);
      path.lineTo(
        0,
        lerpDouble(0, size.height / 12, orangeAnimation.value),
      );

      _addPointsToPath(path, [
        Point(
          size.width / 7,
          lerpDouble(0, size.height / 6, liquidAnimation.value),
        ),
        Point(
          size.width / 3,
          lerpDouble(0, size.height / 10, liquidAnimation.value),
        ),
        Point(
          size.width / 3 * 2,
          lerpDouble(0, size.height / 8, liquidAnimation.value),
        ),
        Point(
          size.width * 3 / 4,
          0,
        ),
      ]);
      canvas.drawPath(path, orangePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  // method to determine points to draw the beziercurve
  void _addPointsToPath(Path path, List<Point> points) {
    if (points.length < 3) {
      throw UnsupportedError("Need three or more points to create a path");
    }

    for (int i = 0; i < points.length - 2; i++) {
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }

    path.quadraticBezierTo(
        points[points.length - 2].x,
        points[points.length - 2].y,
        points[points.length - 1].x,
        points[points.length - 1].y);
  }
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}
