import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percentages_with_animation/percentages_with_animation.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Cycling_screen/cycling_start.dart';
import 'package:x_fitness/widgets/my_Button.dart';
import 'package:x_fitness/widgets/my_Text.dart';
class TotalCyclingUi extends StatelessWidget {
  const TotalCyclingUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorUtils.appGreen
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  GradientCirclePercentage(
                    currentPercentage: 70,
                    maxPercentage: 100,
                    size: 130,
                    duration: 2000,
                    percentageStrokeWidth: 20,
                    bottomColor: Colors.green,
                    backgroundStrokeWidth: 2,
                    centerTextStyle:GoogleFonts.playfairDisplay(
                        color: ColorUtils.black,
                        fontSize: 25
                    ),
                    onCurrentValue: (currentValue) {
                      // if (kDebugMode) {
                      //   print("GradientCirclePercentage currentValue: $currentValue");
                      // }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: TextWidget(
                      title: 'Total distance\n(KM)',
                      fontSize: 9,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              HorizontalSpace(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    title: 'Daily Plan Is Not\nSet  Completly',
                    fontSize: 20,
                    textAlign: TextAlign.start,
                    textColor: ColorUtils.black,
                    fontWeight: FontWeight.w600,
                  ),
                  VerticalSpace(height: 10),
                  MyButton(navigateTo: (){
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: CyclingStart(),
                      withNavBar: false,
                    );
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => CyclingStart(),));
                  }, buttonName: 'Start',height: 40,width: 150,borderRadius: 10,)
                ],
              )
            ],
          ),
        ),
        VerticalSpace(height: 15),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: ColorUtils.grey
            gradient: AppGradients.greyTopTOBlackBottom,
              border: Border.all(color: ColorUtils.white.withOpacity(0.3),width: 1.1)
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    title: 'Spin Total Cycling Program',
                    fontSize: 16,
                    textAlign: TextAlign.start,
                    textColor: ColorUtils.white,
                    fontWeight: FontWeight.w600,
                  ),
                  TextWidget(
                    title: '13 Feb 2025',
                    fontSize: 14,
                    textAlign: TextAlign.center,
                    textColor: ColorUtils.white,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
              VerticalSpace(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image(image: AssetImage(ImagesUtils.time,),height:13),
                      HorizontalSpace(width:5),
                      TextWidget(
                        title: '30 Min',
                        fontSize: 14,
                        textAlign: TextAlign.start,
                        textColor: ColorUtils.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                  HorizontalSpace(width: 14),
                  Row(
                    children: [
                      Image(image: AssetImage(ImagesUtils.step,),height:13,color:Colors.purpleAccent),
                      HorizontalSpace(width:5),
                      TextWidget(
                        title: '4*30 reps',
                        fontSize: 14,
                        textAlign: TextAlign.center,
                        textColor: ColorUtils.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                ],
              ),
              VerticalSpace(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image: AssetImage(ImagesUtils.calories,),height:15,color: ColorUtils.orange),
                        HorizontalSpace(width:4),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              title: 'Calories(Kcal)',
                              fontSize: 12,
                              textAlign: TextAlign.center,
                              textColor: ColorUtils.white,
                              fontWeight: FontWeight.w400,
                            ),
                            VerticalSpace(height: 8),
                            Text('0.00',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 1.5,
                    color: ColorUtils.white.withOpacity(0.3),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image: AssetImage(ImagesUtils.time,),height:15),
                        HorizontalSpace(width: 3),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              title: 'Total Time',
                              fontSize: 12,
                              textAlign: TextAlign.center,
                              textColor: ColorUtils.white,
                              fontWeight: FontWeight.w400,
                            ),
                            VerticalSpace(height: 8),
                            Text('00:00',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
                          ],
                        ),
                        HorizontalSpace(width: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
