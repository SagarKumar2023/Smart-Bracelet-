import 'package:flutter/material.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/widgets/my_Text.dart';

import 'BodyFat_Ui.dart';
import 'SPO2_Ui.dart';
import 'Sleep_Ui.dart';
import 'Sports_Ui.dart';
import 'StaticsScreens_design/StaticsScreens_design.dart';
class StaticsScreen extends StatefulWidget {
  const StaticsScreen({super.key});

  @override
  State<StaticsScreen> createState() => _StaticsScreenState();
}

// class _StaticsScreenState extends State<StaticsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorUtils.screenBackground,
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: ListView(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(width: 30),
//                 TextWidget(
//                   title: 'Statics',
//                   fontSize: 16,
//                   textAlign: TextAlign.center,
//                   textColor: ColorUtils.white,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 IconButton(onPressed: (){}, icon:Icon(Icons.calendar_month,color: ColorUtils.white,))
//               ],
//             ),
//             VerticalSpace(height: 15),
//             MyRichText(
//               textOne: 'Fitness',
//               textTwo: ' Categories ',
//               textThree: 'to begin Your Journey',
//               textColor: ColorUtils.white,
//               textTwoColor: ColorUtils.appGreen,
//               fontSize: 25,
//               fontWeight: FontWeight.w700,
//             ),
//             VerticalSpace(height: 15),
//             StaticsScreensDesign(
//               titleOne: 'Sports',
//               titleOneBgImage:ImagesUtils.sportsBg,
//               titleOneOnTap: () {  },
//               titleTwo: 'Body Fat',
//               titleTwoBgImage: ImagesUtils.bodyFatBg,
//               titleTwoOnTap: () {  },
//               titleOneBorderColor: ColorUtils.appGreen,
//               titleTwoBorderColor: ColorUtils.appGreen,
//             ),
//             VerticalSpace(height: 10),
//             StaticsScreensDesign(
//               titleOne: 'SPO2',
//               titleOneBgImage:ImagesUtils.spo2Bg,
//               titleOneOnTap: () {  },
//               titleTwo: 'Sleep',
//               titleTwoBgImage: ImagesUtils.sleepBg,
//               titleTwoOnTap: () {  },
//               titleOneBorderColor: ColorUtils.appGreen,
//               titleTwoBorderColor: ColorUtils.appGreen,
//             ),
//             /// bY DEFALUTE SPORT SELECTED RAHEGA OR SportsUi() display hoga
//             /// sport click ka function function titleOneOnTap: () {  },titleOneBorderColor: ColorUtils.appGreen,
//             /// Body Fat click karne ka function titleTwoOnTap: () {  }titleTwoBorderColor: ColorUtils.appGreen,
//             /// SPO2 Fat click karne ka function titleTwoOnTap: () {  }titleOneBorderColor: ColorUtils.appGreen,
//             /// Sleep Fat click karne ka function titleTwoOnTap: () {  }titleTwoBorderColor: ColorUtils.appGreen,
//             /// jo select rahega titleOneBorderColor ColorUtils.appGreen
//             /// jo select na ho titleOneBorderColor ColorUtils.white
//             /// ui ko display karna hai SportsUi(),BodyFatUi(),Spo2Ui(),SleepUi()
//
//           ],
//         ),
//       ),
//     );
//   }
class _StaticsScreenState extends State<StaticsScreen> {
  String selectedCategory = 'Sports'; // default selection

  Widget getSelectedUi() {
    switch (selectedCategory) {
      case 'Sports':
        return SportsUi();
      case 'Body Fat':
        return BodyFatUi();
      case 'SPO2':
        return Spo2Ui();
      case 'Sleep':
        return SleepUi();
      default:
        return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorUtils.black,

      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: BoxDecoration(
          // gradient:AppGradients.blackToBlueGrey,
          color: ColorUtils.black
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30),
                  TextWidget(
                    title: 'Statistic',
                    fontSize: 18,
                    textAlign: TextAlign.center,
                    textColor: ColorUtils.white,
                    fontWeight: FontWeight.w700,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.calendar_month, color: ColorUtils.white),
                  ),
                ],
              ),
              VerticalSpace(height: 10),
              MyRichText(
                textOne: 'Fitness',
                textTwo: ' Categories ',
                textThree: 'to begin Your Journey',
                textColor: ColorUtils.white,
                textTwoColor: ColorUtils.appGreen,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
              VerticalSpace(height: 25),

              StaticsScreensDesign(
                titleOne: 'Sports',
                titleOneBgImage: ImagesUtils.sportsBg,
                titleOneOnTap: () {
                  setState(() {
                    selectedCategory = 'Sports';
                  });
                },
                titleTwo: 'Body Fat',
                titleTwoBgImage: ImagesUtils.bodyFatBg,
                titleTwoOnTap: () {
                  setState(() {
                    selectedCategory = 'Body Fat';
                  });
                },
                titleOneBorderColor: selectedCategory == 'Sports' ? ColorUtils.appGreen : ColorUtils.white,
                titleTwoBorderColor: selectedCategory == 'Body Fat' ? ColorUtils.appGreen : ColorUtils.white,
              ),

              VerticalSpace(height: 10),

              StaticsScreensDesign(
                titleOne: 'SPO2',
                titleOneBgImage: ImagesUtils.spo2Bg,
                titleOneOnTap: () {
                  setState(() {
                    selectedCategory = 'SPO2';
                  });
                },
                titleTwo: 'Sleep',
                titleTwoBgImage: ImagesUtils.sleepBg,
                titleTwoOnTap: () {
                  setState(() {
                    selectedCategory = 'Sleep';
                  });
                },
                titleOneBorderColor: selectedCategory == 'SPO2' ? ColorUtils.appGreen : ColorUtils.white,
                titleTwoBorderColor: selectedCategory == 'Sleep' ? ColorUtils.appGreen : ColorUtils.white,
              ),

              VerticalSpace(height: 20),

              // Selected Category UI Display
              getSelectedUi(),
            ],
          ),
        ),
      ),
    );
  }
}


