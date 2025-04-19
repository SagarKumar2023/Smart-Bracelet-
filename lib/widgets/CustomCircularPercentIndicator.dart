import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCircularPercentIndicator extends StatelessWidget {
  final double radius;
  final double lineWidth;
  final double percent;
  final Widget? center;
  final Color? progressColor;
  final Color? backgroundColor;
  final Color? arcBackgroundColor;
  final double? startAngle;
  final double? backgroundWidth;
  final LinearGradient? linearGradient;
  final bool? animation;
  final int? animationDuration;
  final Widget? header;
  final Widget? footer;
  final CircularStrokeCap? circularStrokeCap;
  final bool? addAutomaticKeepAlive;
  final bool? animateFromLastPercent;
  final bool? reverse;
  final Curve? curve;
  final MaskFilter? maskFilter;
  final bool? restartAnimation;
  final void Function()? onAnimationEnd;
  final Widget? widgetIndicator;
  final bool? rotateLinearGradient;

  CustomCircularPercentIndicator({
    required this.radius,
    required this.lineWidth,
    required this.percent,
    this.center,
    this.progressColor,
    this.backgroundColor,
    this.arcBackgroundColor,
    this.startAngle,
    this.backgroundWidth,
    this.linearGradient,
    this.animation,
    this.animationDuration,
    this.header,
    this.footer,
    this.circularStrokeCap,
    this.addAutomaticKeepAlive,
    this.animateFromLastPercent,
    this.reverse,
    this.curve,
    this.maskFilter,
    this.restartAnimation,
    this.onAnimationEnd,
    this.widgetIndicator,
    this.rotateLinearGradient,
  });

  @override
  Widget build(BuildContext context) {
    double size = radius * 2;

    return Container(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CustomCircularPainter(
          progressColor: progressColor ?? Colors.blue,
          backgroundColor: backgroundColor ?? Colors.grey.shade200,
          arcBackgroundColor: arcBackgroundColor,
          lineWidth: lineWidth,
          percent: percent,
          radius: radius,
          startAngle: startAngle ?? 90.0,
          backgroundWidth: backgroundWidth ?? lineWidth,
          linearGradient: linearGradient,
          animation: animation ?? false,
          animationDuration: animationDuration ?? 500,
          header: header,
          footer: footer,
          circularStrokeCap: circularStrokeCap ?? CircularStrokeCap.round,
          addAutomaticKeepAlive: addAutomaticKeepAlive ?? true,
          animateFromLastPercent: animateFromLastPercent ?? false,
          reverse: reverse ?? false,
          curve: curve ?? Curves.linear,
          maskFilter: maskFilter,
          restartAnimation: restartAnimation ?? false,
          onAnimationEnd: onAnimationEnd,
          widgetIndicator: widgetIndicator,
          rotateLinearGradient: rotateLinearGradient ?? false,
        ),
        child: Center(child: center),
      ),
    );
  }
}

class _CustomCircularPainter extends CustomPainter {
  final Color progressColor;
  final Color backgroundColor;
  final Color? arcBackgroundColor;
  final double lineWidth;
  final double percent;
  final double radius;
  final double startAngle;
  final double backgroundWidth;
  final LinearGradient? linearGradient;
  final bool animation;
  final int animationDuration;
  final Widget? header;
  final Widget? footer;
  final CircularStrokeCap circularStrokeCap;
  final bool addAutomaticKeepAlive;
  final bool animateFromLastPercent;
  final bool reverse;
  final Curve curve;
  final MaskFilter? maskFilter;
  final bool restartAnimation;
  final void Function()? onAnimationEnd;
  final Widget? widgetIndicator;
  final bool rotateLinearGradient;

  _CustomCircularPainter({
    required this.progressColor,
    required this.backgroundColor,
    this.arcBackgroundColor,
    required this.lineWidth,
    required this.percent,
    required this.radius,
    this.startAngle = 90.0,
    this.backgroundWidth = -1,
    this.linearGradient,
    this.animation = false,
    this.animationDuration = 500,
    this.header,
    this.footer,
    this.circularStrokeCap = CircularStrokeCap.round,
    this.addAutomaticKeepAlive = true,
    this.animateFromLastPercent = false,
    this.reverse = false,
    this.curve = Curves.linear,
    this.maskFilter,
    this.restartAnimation = false,
    this.onAnimationEnd,
    this.widgetIndicator,
    this.rotateLinearGradient = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double startAngleRadians = _degreeToRadian(startAngle);
    final double sweepAngleRadians = _degreeToRadian(270.0); // Always 270 degrees

    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..strokeCap = circularStrokeCap == CircularStrokeCap.round
          ? StrokeCap.round
          : StrokeCap.butt;

    final Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..strokeCap = circularStrokeCap == CircularStrokeCap.round
          ? StrokeCap.round
          : StrokeCap.butt;

    if (arcBackgroundColor != null) {
      backgroundPaint.color = arcBackgroundColor!;
    }

    // Draw background arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius - lineWidth / 2),
      startAngleRadians,
      sweepAngleRadians,
      false,
      backgroundPaint,
    );

    // Draw progress arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius - lineWidth / 2),
      startAngleRadians,
      sweepAngleRadians * percent,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  double _degreeToRadian(double degree) {
    return degree * (3.141592653589793 / 180.0);
  }
}
