// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:x_fitness/constant/color_Utils.dart';
// import 'package:x_fitness/constant/images.dart';
// import 'package:x_fitness/constant/screen_Size.dart';
// import 'package:x_fitness/constant/spacer.dart';
// import 'package:x_fitness/widgets/CustomCircularPercentIndicator.dart';
// import 'package:x_fitness/widgets/my_Text.dart';
//
// import 'fitness_type_ui/fitness_type_ui.dart';
// class TotalRunningUi extends StatelessWidget {
//   const TotalRunningUi({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Column(
//       children: [
//         Container(
//           width: screenWidth(context),
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               // color: ColorUtils.black.withOpacity(0.6)
//               border: Border.all(color: ColorUtils.white.withOpacity(0.2),width: 1.3)
//           ),
//           child: Center(
//             child: CustomCircularPercentIndicator(
//               radius: 100.0,
//               lineWidth: 15.0,
//               percent: 0.55,
//               startAngle: 135,
//               circularStrokeCap:CircularStrokeCap.round,
//               progressColor: ColorUtils.orange.withOpacity(0.8),
//               backgroundColor:
//               Colors.grey.shade200,
//               center: Container(
//                 height: 165,
//                 width: 165,
//                 padding: EdgeInsets.only(top: 25),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   // color: ColorUtils.black
//                   // gradient: LinearGradient(
//                   //   begin: Alignment.topLeft,
//                   //   end: Alignment.bottomRight,
//                   //   stops: [0.1, 1.0],
//                   //   colors: [
//                   //     Color(0xFF3B2667),
//                   //     Color(0xFFBC78EC),
//                   //   ],
//                   // ),
//                   gradient: LinearGradient(
//                     colors: [Color(0xFF434343), Color(0xFF000000)],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextWidget(
//                       title: 'Total distance(KM)',
//                       fontSize: 10,
//                       textAlign: TextAlign.center,
//                       textColor: ColorUtils.white,
//                       fontWeight: FontWeight.w600,
//                       letterSpacing: 2,
//                     ),
//                     VerticalSpace(height: 10),
//                     Image(image: AssetImage(ImagesUtils.location,),height: 35,),
//                     VerticalSpace(height: 5),
//                     Text('0.00',style: TextStyle(fontSize: 30,color: ColorUtils.white.withOpacity(0.9)),),
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         VerticalSpace(height: 10),
//         Row(
//           children: [
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.only(left: 2,right: 2,top: 8,bottom: 3),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: ColorUtils.white.withOpacity(0.2),width: 1.3)
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextWidget(
//                       title: 'Calories (Kcal)',
//                       fontSize: 12,
//                       textAlign: TextAlign.center,
//                       textColor: ColorUtils.white,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     VerticalSpace(height: 8),
//                     Image(image: AssetImage(ImagesUtils.calories,),height:25,color: ColorUtils.orange),
//                     VerticalSpace(height: 8),
//                     Text('0.00',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
//                   ],
//                 ),
//               ),
//             ),
//             HorizontalSpace(width: 8),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.only(left: 2,right: 2,top: 8,bottom: 3),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: ColorUtils.white.withOpacity(0.2),width: 1.3)
//
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextWidget(
//                       title: 'Total Time',
//                       fontSize: 12,
//                       textAlign: TextAlign.center,
//                       textColor: ColorUtils.white,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     VerticalSpace(height: 8),
//                     Image(image: AssetImage(ImagesUtils.time,),height:25,color: Color(0xffF62817)),
//                     VerticalSpace(height: 8),
//                     Text('00:00',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
//                   ],
//                 ),
//               ),
//             ),
//             HorizontalSpace(width: 8),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.only(left: 2,right: 2,top: 8,bottom: 3),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: ColorUtils.white.withOpacity(0.2),width: 1.3)
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextWidget(
//                       title: 'Total Steps',
//                       fontSize: 12,
//                       textAlign: TextAlign.center,
//                       textColor: ColorUtils.white,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     VerticalSpace(height: 8),
//                     Image(image: AssetImage(ImagesUtils.step,),height:25,color: Color(0xff22CE83),),
//                     VerticalSpace(height: 8),
//                     Text('0.00',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
//
//
//
///
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percentages_with_animation/percentages_with_animation.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Running_screen/running_start.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/MeScreens/Add_Device_Screen/RingSizeCalculate/Rough_code/Rough_code.dart';
import 'package:x_fitness/widgets/my_Button.dart';
import 'package:x_fitness/widgets/my_Text.dart';
import '../../../../constant/screen_Size.dart';
import '../../MeScreens/Add_Device_Screen/RingSizeCalculate/RingSizeCalculate.dart';

class TotalRunningUi extends StatelessWidget {
  const TotalRunningUi({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
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
                  MyButton(
                    navigateTo: (){
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: RunningStart(),
                        withNavBar: false,
                      );
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
                    title: 'Spin Total Running Program',
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
                  Container(
                    height: 50,
                    width: 1.5,
                    color: ColorUtils.white.withOpacity(0.3),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage(ImagesUtils.step,),height:15,color:Colors.purpleAccent),
                        HorizontalSpace(width: 2),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              title: 'Total Steps',
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
                ],
              ),
            ],
          ),
        ),
        VerticalSpace(height: 15),
        MyButton(navigateTo: (){
          PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: Ringsizecalculate(),
          withNavBar: false,
        );
        },buttonTextColor: ColorUtils.black,
          buttonName:'Ring size Finder',
          height: 50,width: screenWidth(context),
          borderRadius: 13,buttonColor: ColorUtils.appGreen,
        ),
        VerticalSpace(height: 15),
        // MyButton(navigateTo: (){
        //   PersistentNavBarNavigator.pushNewScreen(
        //     context,
        //     screen: RoughCode(),
        //     withNavBar: false,
        //   );
        // },buttonTextColor: ColorUtils.black,
        //   buttonName:'Rough Screen',
        //   height: 50,width: screenWidth(context),
        //   borderRadius: 13,buttonColor: ColorUtils.appGreen,
        // )
      ],
    );
  }
}




