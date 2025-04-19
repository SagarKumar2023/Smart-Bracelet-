import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/widgets/back_button.dart';
import 'package:x_fitness/widgets/my_Button.dart';
import 'package:x_fitness/widgets/my_Text.dart';
import '../../../../../../constant/screen_Size.dart';
import 'Cycling_caloriesProvider.dart';

class CyclingEditCaloriesScreen extends StatefulWidget {
  const CyclingEditCaloriesScreen({super.key});

  @override
  State<CyclingEditCaloriesScreen> createState() => _CyclingEditCaloriesScreenState();
}

class _CyclingEditCaloriesScreenState extends State<CyclingEditCaloriesScreen> {
  String caloriesInput = '';

  void updateInput(String value) {
    setState(() {
      if (value == '╳') {
        if (caloriesInput.isNotEmpty) {
          caloriesInput = caloriesInput.substring(0, caloriesInput.length - 1);
        }
        return;
      }

      if (RegExp(r'\d').hasMatch(value)) {
        if (caloriesInput.length >= 3) return;
        caloriesInput += value;
      }
    });
  }

  void saveValue() {
    if (caloriesInput.isEmpty) {
      AnimatedSnackBar.material(
          'The calories Cannot be empty.',
          type: AnimatedSnackBarType.warning,
          mobileSnackBarPosition: MobileSnackBarPosition.bottom, // or bottom
          duration: const Duration(seconds: 4),
          animationCurve: Curves.elasticInOut
      ).show(context);
    } else {
      Provider.of<CyclingCaloriesProvider>(context, listen: false).setCalories(caloriesInput);
      Navigator.pop(context);
    }
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
                            title: 'Edit Calories',
                            fontSize: 18,
                            textAlign: TextAlign.center,
                            textColor: ColorUtils.white,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(width: 50),
                        ],
                      ),
                      VerticalSpace(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            caloriesInput.isEmpty ? '0' : '$caloriesInput',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 40,
                              color: ColorUtils.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: TextWidget(
                              title: '  kcal',
                              fontSize: 15,
                              textAlign: TextAlign.center,
                              textColor: ColorUtils.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
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
                  borderRadius: BorderRadius.only(
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
                    Row(children: [Spacer(),HorizontalSpace(width: 10), buildButton('0'), HorizontalSpace(width: 10), buildButton('╳',textColor: ColorUtils.white,backgroundColor: Colors.transparent)]),
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
