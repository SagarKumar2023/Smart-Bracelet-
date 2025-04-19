import 'package:flutter/material.dart';

class DeviceSearchRadar extends StatefulWidget {
  const DeviceSearchRadar({super.key, });

  @override
  State<DeviceSearchRadar> createState() => _DeviceSearchRadarState();
}

class _DeviceSearchRadarState extends State<DeviceSearchRadar>with SingleTickerProviderStateMixin   {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _scaleAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(end: 0.8, begin: 1.1), weight: 50),
      TweenSequenceItem(tween: Tween(end: 1.1, begin: 0.8), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _colorAnimation = TweenSequence<Color?>([
      TweenSequenceItem(
        tween: ConstantTween(Colors.transparent),
        weight: 50, // 0 to 1 sec
      ),
      TweenSequenceItem(
        tween: ColorTween(
          begin: Colors.green,
          end: Colors.green.withOpacity(0.05),
        ),
        weight: 50, // 1 to 2 sec
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width:180,
            height:180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _colorAnimation.value,
            ),

          ),
        );
      },
    );
  }
}

