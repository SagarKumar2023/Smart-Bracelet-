import 'package:flutter/material.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Running_screen/totalRunning_ui.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Skipping_screen/totalSkipping_ui.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Cycling_screen/total_cycling_ui.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/spo2_screen/totalspo2_ui.dart';
import 'package:x_fitness/widgets/my_Text.dart';
import '../../../widgets/MyTextField.dart';
import 'body_fat_measure_screen/total_BFM_UI.dart';
import 'fitness_type_ui/fitness_type_ui.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}


class _HomescreenState extends State<Homescreen> {
  String selectedType = 'Running';

  Widget getSelectedUi() {
    switch (selectedType) {
      case 'Running':
        return TotalRunningUi();
      case 'Cycling':
        return TotalCyclingUi();
      case 'Skipping':
        return TotalSkippingUi();
      case 'Body fat measure':
        return TotalBFMUi();
      case 'spo2':
        return TotalSpo2Ui();
      default:
        return SizedBox();
    }
  }
  TextEditingController searchCtr = TextEditingController();
  bool showSearchField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10),
            decoration: BoxDecoration(
              // color: ColorUtils.grey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          title: 'Hi! Morris',
                          fontSize: 16,
                          textAlign: TextAlign.center,
                          textColor: ColorUtils.appGreen,
                          fontWeight: FontWeight.w800,
                        ),
                        TextWidget(
                          title: 'Welcome to CycleGo',
                          fontSize: 12,
                          textAlign: TextAlign.center,
                          textColor: ColorUtils.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                    /// Conditional UI
                    showSearchField
                        ? SizedBox(
                      width: 195,
                      height: 45,
                      child: MyTextField(
                        controller: searchCtr,
                        borderRadius: 50,
                        hintText: "Search",
                        suffixIcon: IconButton(
                          icon: Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorUtils.white,
                              ),
                              child: Icon(Icons.close,color: ColorUtils.red,size: 15,)),
                          onPressed: () {
                            setState(() {
                              showSearchField = false;
                              searchCtr.clear();
                            });
                          },
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    )
                        : GestureDetector(
                      onTap: () {
                        setState(() {
                          showSearchField = true;
                        });
                      },
                      child: Container(
                        height: 45,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: ColorUtils.appGreen,
                        ),
                        child: Row(
                          children: [
                            HorizontalSpace(width: 12),
                            TextWidget(
                              title: 'Search',
                              fontSize: 14,
                              textAlign: TextAlign.center,
                              textColor: ColorUtils.black,
                            ),
                            HorizontalSpace(width: 8),
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorUtils.white,
                              ),
                              child: Image.asset(
                                ImagesUtils.meIcon,
                                width: 20,
                                height: 20,
                                fit: BoxFit.fill,
                                color: ColorUtils.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 12,right: 12,bottom: 2,top: 2),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: BoxDecoration(
          color: ColorUtils.black
          // gradient:AppGradients.blackToBlueGrey,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...['Running', 'Cycling', 'Skipping', 'Body fat measure', 'spo2'].map((type) {
                    final bool isSelected = selectedType == type;
                    return Row(
                      children: [
                        FitnessTypeUi(
                          onTap: () {
                            setState(() {
                              selectedType = type;
                            });
                          },
                          title: type,
                          leading: getIconForType(type),
                          indicatorColor: isSelected ? ColorUtils.appGreen : Colors.transparent,
                          borderColor: ColorUtils.white.withOpacity(0.2),
                          iconColor: isSelected ? ColorUtils.red : ColorUtils.black,
                          titleColor: isSelected ? ColorUtils.black : ColorUtils.white,
                        ),
                        HorizontalSpace(width: 8),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
            VerticalSpace(height: 15),
            getSelectedUi(), // Display selected UI
          ],
        ),
      ),
    );
  }

  /// Helper method to get icon for each type
  String getIconForType(String type) {
    switch (type) {
      case 'Running':
        return ImagesUtils.running;
      case 'Cycling':
        return ImagesUtils.cycling;
      case 'Skipping':
        return ImagesUtils.skipping;
      case 'Body fat measure':
        return ImagesUtils.bodyFatMeasure;
      case 'spo2':
        return ImagesUtils.spo2;
      default:
        return '';
    }
  }
}
///
// class _HomescreenState extends State<Homescreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorUtils.black,
//       body:Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           shrinkWrap: true,
//           children: [
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   /// by default running clickable rahega or running ka ui display hoa
//                   /// then uske baad user jis pe bhi click karega Running,Cycling,Skipping,Body fat measure,spo2
//                   /// ui chage hoga
//                   /// Running => TotalRunningUi()
//                   /// Cycling =>TotalCyclingUi()
//                   /// Skipping=>TotalSkippingUi()
//                   /// Body fat measure=>TotalBodyFatMeasure()
//                   /// sected color hoga  indicatorColor: ColorUtils.appGreen, iconColor: ColorUtils.blue,  titleColor: ColorUtils.black,
//                   /// unselected color hoga indicatorColor: ColorUtils.transparent, iconColor: ColorUtils.black,titleColor: ColorUtils.white,
//                   FitnessTypeUi(
//                     onTap: () {  },
//                     title: 'Running',
//                     leading: ImagesUtils.running,
//                     indicatorColor: ColorUtils.appGreen,
//                     borderColor: ColorUtils.white.withOpacity(0.2),
//                     iconColor: ColorUtils.blue,
//                     titleColor: ColorUtils.black,
//                   ),
//                   HorizontalSpace(width: 8),
//                   FitnessTypeUi(
//                     onTap: () {  },
//                     title: 'Cycling',
//                     leading: ImagesUtils.cycling,
//                     indicatorColor: ColorUtils.appGreen,
//                     borderColor: ColorUtils.white.withOpacity(0.2),
//                     iconColor: ColorUtils.blue,
//                     titleColor: ColorUtils.black,
//                   ),
//                   HorizontalSpace(width: 8),
//                   FitnessTypeUi(
//                     onTap: () {  },
//                     title: 'Skipping',
//                     leading: ImagesUtils.skipping,
//                     indicatorColor: ColorUtils.appGreen,
//                     borderColor: ColorUtils.white.withOpacity(0.2),
//                     iconColor: ColorUtils.blue,
//                     titleColor: ColorUtils.black,
//                   ),
//                   HorizontalSpace(width: 8),
//                   FitnessTypeUi(
//                     onTap: () {  },
//                     title: 'Body fat measure',
//                     leading: ImagesUtils.bodyFatMeasure,
//                     indicatorColor: ColorUtils.appGreen,
//                     borderColor: ColorUtils.white.withOpacity(0.2),
//                     iconColor: ColorUtils.blue,
//                     titleColor: ColorUtils.black,
//                   ),
//                   HorizontalSpace(width: 8),
//                   FitnessTypeUi(
//                     onTap: () {  },
//                     title: 'spo2',
//                     leading: ImagesUtils.spo2,
//                     indicatorColor: ColorUtils.appGreen,
//                     borderColor: ColorUtils.white.withOpacity(0.2),
//                     iconColor: ColorUtils.blue,
//                     titleColor: ColorUtils.black,
//                   ),
//                 ],
//               ),
//             ),
//             VerticalSpace(height: 10),
//             /// ui yaha pe displaye karna hai
//           ],
//         ),
//       )
//     );
//   }
// }


///
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:x_fitness/constant/color_Utils.dart';
// import 'package:x_fitness/constant/images.dart';
// import 'package:x_fitness/constant/screen_Size.dart';
// import 'package:x_fitness/constant/spacer.dart';
// import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/totalBodyFatMeasure.dart';
// import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/totalRunning_ui.dart';
// import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/totalSkipping_ui.dart';
// import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/total_cycling_ui.dart';
// import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/totalspo2_ui.dart';
// import 'package:x_fitness/widgets/CustomCircularPercentIndicator.dart';
// import 'package:x_fitness/widgets/my_Text.dart';
//
// import 'fitness_type_ui/fitness_type_ui.dart';
//
// enum FitnessType {
//   running,
//   cycling,
//   skipping,
//   bodyFatMeasure,
//   spo2,
// }
//
// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});
//
//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }
//
// class _HomescreenState extends State<Homescreen> {
//   FitnessType selectedType = FitnessType.running;
//
//   Widget _getSelectedWidget() {
//     switch (selectedType) {
//       case FitnessType.running:
//         return const TotalRunningUi();
//       case FitnessType.cycling:
//         return const TotalCyclingUi();
//       case FitnessType.skipping:
//         return const TotalSkippingUi();
//       case FitnessType.bodyFatMeasure:
//         return const TotalBodyFatMeasure();
//       case FitnessType.spo2:
//         return const TotalSpo2Ui();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorUtils.screenBackground,
//       body: Padding(
//         padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 70),
//         child: ListView(
//           shrinkWrap: true,
//           children: [
//             AnimatedSwitcher(
//               switchInCurve: Curves.easeIn,
//               duration: const Duration(milliseconds: 400),
//               transitionBuilder: (Widget child, Animation<double> animation) {
//                 return ScaleTransition(scale: animation, child: child);
//               },
//               child: KeyedSubtree(
//                 key: ValueKey(selectedType),
//                 child: _getSelectedWidget(),
//               ),
//             ),
//             VerticalSpace(height: 16),
//
//             /// Fitness Type Selectors
//             FitnessTypeUi(
//               onTap: () => setState(() => selectedType = FitnessType.running),
//               title: 'Running',
//               leading: ImagesUtils.running,
//             ),
//             VerticalSpace(height: 5),
//             FitnessTypeUi(
//               onTap: () => setState(() => selectedType = FitnessType.cycling),
//               title: 'Cycling',
//               leading: ImagesUtils.cycling,
//             ),
//             VerticalSpace(height: 5),
//             FitnessTypeUi(
//               onTap: () => setState(() => selectedType = FitnessType.skipping),
//               title: 'Skipping',
//               leading: ImagesUtils.skipping,
//             ),
//             VerticalSpace(height: 5),
//             FitnessTypeUi(
//               onTap: () => setState(() => selectedType = FitnessType.bodyFatMeasure),
//               title: 'Body fat measure',
//               leading: ImagesUtils.bodyFatMeasure,
//             ),
//             VerticalSpace(height: 5),
//             FitnessTypeUi(
//               onTap: () => setState(() => selectedType = FitnessType.spo2),
//               title: 'spo2',
//               leading: ImagesUtils.spo2,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
///
// Row(
//   children: [
//     Container(
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: ColorUtils.white.withOpacity(0.2),width: 1.3)
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           TextWidget(
//             title: 'Total distance(KM)',
//             fontSize: 12,
//             textAlign: TextAlign.center,
//             textColor: ColorUtils.white,
//             fontWeight: FontWeight.w500,
//             letterSpacing: 2,
//           ),
//           VerticalSpace(height: 15),
//           DottedBorder(
//             color: ColorUtils.white.withOpacity(0.3),
//             borderType: BorderType.RRect,
//             radius: Radius.circular(100),
//             padding: EdgeInsets.all(10),
//             strokeWidth: 1.3,
//             child: CustomCircularPercentIndicator(
//               radius:80, lineWidth: 14, percent:0.40,startAngle:135,
//               circularStrokeCap:CircularStrokeCap.round,
//               progressColor: ColorUtils.orange.withOpacity(0.8),
//               backgroundColor:
//               Colors.grey.shade200,
//               center: Container(
//                 height: 110,
//                 width: 110,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: LinearGradient(
//                     colors: [Color(0xFF434343), Color(0xFF000000)],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // TextWidget(
//                     //   title: 'Total distance(KM)',
//                     //   fontSize: 10,
//                     //   textAlign: TextAlign.center,
//                     //   textColor: ColorUtils.white,
//                     //   fontWeight: FontWeight.w600,
//                     //   letterSpacing: 2,
//                     // ),
//                     // VerticalSpace(height: 10),
//                     Image(image: AssetImage(ImagesUtils.location,),height: 35,),
//                     VerticalSpace(height: 5),
//                     Text('0.00',style: TextStyle(fontSize: 30,color: ColorUtils.white.withOpacity(0.9)),),
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           VerticalSpace(height: 15),
//           MyButton(
//             navigateTo: (){},
//             buttonName: 'Start',
//             height: 35,
//             borderRadius: 7,
//             width: 170,
//           )
//         ],
//       ),
//     ),
//     HorizontalSpace(width: 8),
//     Expanded(
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.only(left: 2,right: 2,top: 8,bottom: 3),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: ColorUtils.white.withOpacity(0.2),width: 1.3)
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextWidget(
//                   title: 'Calories (Kcal)',
//                   fontSize: 12,
//                   textAlign: TextAlign.center,
//                   textColor: ColorUtils.white,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 VerticalSpace(height: 8),
//                 Image(image: AssetImage(ImagesUtils.calories,),height:25,color: ColorUtils.orange),
//                 VerticalSpace(height: 8),
//                 Text('0.00',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
//               ],
//             ),
//           ),
//           VerticalSpace(height: 8),
//           Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: ColorUtils.orange,
//                 image: DecorationImage(image: AssetImage(ImagesUtils.caloriesBg),fit: BoxFit.fill)
//
//             ),
//             child: Container(
//               padding: EdgeInsets.only(left: 2,right: 2,top: 8,bottom: 3),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: ColorUtils.black.withOpacity(0.3)
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextWidget(
//                     title: 'Total Time',
//                     fontSize: 12,
//                     textAlign: TextAlign.center,
//                     textColor: ColorUtils.white,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   VerticalSpace(height: 8),
//                   Image(image: AssetImage(ImagesUtils.time,),height:25,color: Color(0xffF62817)),
//                   VerticalSpace(height: 8),
//                   Text('0.00',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     )
//   ],
// ),
// VerticalSpace(height: 10),
//
// Row(
//   children: [
//     Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: ColorUtils.orange,
//             image: DecorationImage(image: AssetImage(ImagesUtils.caloriesBg),fit: BoxFit.fill)
//
//         ),
//         child: Container(
//           padding: EdgeInsets.only(left: 2,right: 2,top: 8,bottom: 3),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: ColorUtils.black.withOpacity(0.3)
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextWidget(
//                 title: 'Calories (Kcal)',
//                 fontSize: 12,
//                 textAlign: TextAlign.center,
//                 textColor: ColorUtils.white,
//                 fontWeight: FontWeight.w400,
//               ),
//               VerticalSpace(height: 8),
//               Image(image: AssetImage(ImagesUtils.calories,),height:25,color: ColorUtils.orange),
//               VerticalSpace(height: 8),
//               Text('0.00',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
//             ],
//           ),
//         ),
//       ),
//     ),
//     HorizontalSpace(width: 8),
//     Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: ColorUtils.orange,
//             image: DecorationImage(image: AssetImage(ImagesUtils.caloriesBg),fit: BoxFit.fill)
//
//         ),
//         child: Container(
//           padding: EdgeInsets.only(left: 2,right: 2,top: 8,bottom: 3),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: ColorUtils.black.withOpacity(0.3)
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextWidget(
//                 title: 'Total Time',
//                 fontSize: 12,
//                 textAlign: TextAlign.center,
//                 textColor: ColorUtils.white,
//                 fontWeight: FontWeight.w400,
//               ),
//               VerticalSpace(height: 8),
//               Image(image: AssetImage(ImagesUtils.time,),height:25,color: Color(0xffF62817)),
//               VerticalSpace(height: 8),
//               Text('0.00',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
//             ],
//           ),
//         ),
//       ),
//     ),
//     HorizontalSpace(width: 8),
//     Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: ColorUtils.orange,
//             image: DecorationImage(image: AssetImage(ImagesUtils.caloriesBg),fit: BoxFit.fill)
//
//         ),
//         child: Container(
//           padding: EdgeInsets.only(left: 2,right: 2,top: 8,bottom: 3),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: ColorUtils.black.withOpacity(0.3)
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextWidget(
//                 title: 'Total Steps',
//                 fontSize: 12,
//                 textAlign: TextAlign.center,
//                 textColor: ColorUtils.white,
//                 fontWeight: FontWeight.w400,
//               ),
//               VerticalSpace(height: 8),
//               Image(image: AssetImage(ImagesUtils.step,),height:25,color: Color(0xff22CE83),),
//               VerticalSpace(height: 8),
//               Text('0.00',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
//             ],
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
