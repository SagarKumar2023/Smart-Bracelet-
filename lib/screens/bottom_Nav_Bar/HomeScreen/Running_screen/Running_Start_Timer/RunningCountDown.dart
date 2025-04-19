import 'dart:async';
import 'package:flutter/material.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/screen_Size.dart';

import 'Running_Start_Timer.dart';


class RunningCountDown extends StatefulWidget {
  const RunningCountDown({super.key});

  @override
  State<RunningCountDown> createState() => _RunningCountDownState();
}

class _RunningCountDownState extends State<RunningCountDown> {
  int _secondsRemaining = 3;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 1) {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RunningStartTimerScreen()),
        );
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.black,
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: BoxDecoration(
          gradient: AppGradients.blackToBlueGrey
        ),
        child: Center(
          child: Text(
            '$_secondsRemaining',
            style:  TextStyle(
              fontSize: 150,
              fontWeight: FontWeight.bold,
              color: ColorUtils.appGreen,
            ),
          ),
        ),
      ),
    );
  }
}
