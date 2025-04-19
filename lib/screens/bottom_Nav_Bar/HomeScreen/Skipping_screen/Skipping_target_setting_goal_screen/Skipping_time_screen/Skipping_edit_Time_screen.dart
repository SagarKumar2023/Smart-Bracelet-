import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Skipping_screen/Skipping_target_setting_goal_screen/Skipping_time_screen/Skipping_TimeProvider.dart';
import 'package:x_fitness/widgets/back_button.dart';
import 'package:x_fitness/widgets/my_Button.dart';
import 'package:x_fitness/widgets/my_Text.dart';

import '../../../../../../constant/screen_Size.dart';

class SkippingEditTimeScreen extends StatefulWidget {
  const SkippingEditTimeScreen({super.key});

  @override
  State<SkippingEditTimeScreen> createState() => _SkippingEditTimeScreenState();
}

class _SkippingEditTimeScreenState extends State<SkippingEditTimeScreen> {
  int inputIndex = 0;
  String rawInput = '';

  void updateInput(String value) {
    setState(() {
      if (value == '╳') {
        if (rawInput.isNotEmpty) {
          rawInput = rawInput.substring(0, rawInput.length - 1);
          inputIndex = rawInput.length;
        }
        return;
      }

      if (RegExp(r'\d').hasMatch(value) && rawInput.length < 6) {
        rawInput += value;
        inputIndex = rawInput.length;
      }
    });
  }

  void saveValue() {
    if (rawInput.length < 6) {
      AnimatedSnackBar.material(
          'The time Cannot be empty.',
          type: AnimatedSnackBarType.warning,
          mobileSnackBarPosition: MobileSnackBarPosition.bottom, // or bottom
          duration: const Duration(seconds: 4),
          animationCurve: Curves.elasticInOut
      ).show(context);
      return;
    }

    final hh = int.parse(rawInput.substring(0, 2));
    final mm = int.parse(rawInput.substring(2, 4));
    final ss = int.parse(rawInput.substring(4, 6));

    if (hh < 1 || hh > 12 || mm < 0 || mm > 59 || ss < 0 || ss > 59) {
      AnimatedSnackBar.material(
          'HH should be 01–12, MM and SS should be 00–59.',
          type: AnimatedSnackBarType.warning,
          mobileSnackBarPosition: MobileSnackBarPosition.bottom, // or bottom
          duration: const Duration(seconds: 4),
          animationCurve: Curves.elasticInOut
      ).show(context);
      return;
    }

    // Save to Provider
    Provider.of<SkippingTimeProvider>(context, listen: false).setTime(formattedTime);
    Navigator.pop(context);
  }

  Widget buildButton(String value, {Color? textColor, Color? backgroundColor,}) {
    return Expanded(
      child: MyButton(
        navigateTo: () => updateInput(value),
        buttonName: value,
        buttonTextColor: textColor ?? ColorUtils.black,
        borderRadius: 10,
        height: 60,
        buttonColor: backgroundColor ?? ColorUtils.white,
      ),
    );
  }

  String get formattedTime {
    String padded = rawInput.padRight(6, '0');
    String hh = padded.substring(0, 2);
    String mm = padded.substring(2, 4);
    String ss = padded.substring(4, 6);
    return '$hh:$mm:$ss';
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
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyBackButton(onTap: () => Navigator.pop(context)),
                          TextWidget(
                            title: 'Edit Time',
                            fontSize: 18,
                            textAlign: TextAlign.center,
                            textColor: ColorUtils.white,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(width: 50),
                        ],
                      ),
                      VerticalSpace(height: 50),
                      Text(
                        formattedTime,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: ColorUtils.white,
                        ),
                      ),
                      VerticalSpace(height: 25),
                      GestureDetector(
                        onTap: saveValue,
                        child: Container(
                          height: 40,
                          width: 140,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorUtils.white.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(100),
                            gradient: AppGradients.buttonGradient,
                          ),
                          child: Center(
                            child: TextWidget(
                              title: 'Save',
                              fontSize: 15,
                              textAlign: TextAlign.start,
                              textColor: ColorUtils.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(12, 25, 12, 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12)),
                  // color: ColorUtils.grey,
                ),
                child: Column(
                  children: [
                    Row(children: [buildButton('1'), HorizontalSpace(width: 10), buildButton('2'), HorizontalSpace(width: 10), buildButton('3')]),
                    VerticalSpace(height: 10),
                    Row(children: [buildButton('4'), HorizontalSpace(width: 10), buildButton('5'), HorizontalSpace(width: 10), buildButton('6')]),
                    VerticalSpace(height: 10),
                    Row(children: [buildButton('7'), HorizontalSpace(width: 10), buildButton('8'), HorizontalSpace(width: 10), buildButton('9')]),
                    VerticalSpace(height: 10),
                    Row(children: [Spacer(), HorizontalSpace(width: 10), buildButton('0'), HorizontalSpace(width: 10), buildButton('╳',backgroundColor: Colors.transparent,textColor: ColorUtils.white)]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


