import 'package:flutter/material.dart';
import 'package:ring_size_view/list_rings_sizer_country.dart';
import 'package:ring_size_view/model_gold_size.dart';
import 'package:ring_size_view/ring_size_view.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/widgets/my_Text.dart';

class RoughCode extends StatefulWidget {
  const RoughCode({super.key});

  @override
  State<RoughCode> createState() => _RoughCodeState();
}

class _RoughCodeState extends State<RoughCode> {
  double ringSize = 6.0;
  double diameter = 0.0;
  double circumference = 0.0;
  ModelGoldSize modelGoldSize = ModelGoldSize();

  void updateMeasurements() {
    diameter = ringSize * 2;
    circumference = 2 * 3.1416 * ringSize;
  }

  @override
  void initState() {
    super.initState();
    init();
    updateMeasurements();
  }

  init(){
    modelGoldSize = ListRingsSizerCountry.getListSings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Gesture-based Ring Size View
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff000080).withOpacity(0.4), width: 1.4),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                // Detect swipe gesture (up for increase, down for decrease)
                setState(() {
                  ringSize -= details.primaryDelta! / 10;
                  if (ringSize < 6.0) ringSize = 6.0;  // Min size
                  if (ringSize > 16.0) ringSize = 16.0;  // Max size
                  updateMeasurements();
                });
              },
              child: RingSizeView(
                backgroundColor: Colors.transparent,
                textStyle: TextStyle(fontWeight: FontWeight.bold, color: ColorUtils.appGreen),
                ringSize: ringSize,
                calculateDiameter: calculateDiameter,
                calculateRadius: calculateRadius,
                calculateCircumference: calculateCircumference,
                height: screenHeight(context) * 0.3,
                width: screenWidth(context),
              ),
            ),
          ),

          // Ring size control container
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff000080).withOpacity(0.2), width: 1.4),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      title: '12',
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.black,
                      fontWeight: FontWeight.bold,
                    ),
                    TextWidget(
                      title: '32',
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  calculateCircumference(value) {
    circumference = value;
    print("Info calculateCircumference : $value");
  }

  calculateRadius(value) {
    print("Info calculateRadius : $value");
  }

  calculateDiameter(value) {
    diameter = value;
    print("Info calculateDiameter : $value");
  }
}
