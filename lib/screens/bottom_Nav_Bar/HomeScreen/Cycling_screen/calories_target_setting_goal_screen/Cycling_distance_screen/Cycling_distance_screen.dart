import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Cycling_screen/calories_target_setting_goal_screen/Cycling_time_screen/Cycling_edit_Time_screen.dart';
import 'package:x_fitness/widgets/my_Button.dart';
import 'package:x_fitness/widgets/my_Text.dart';
import '../../../Running_screen/Running_Start_Timer/RunningCountDown.dart';
import 'Cycling_DistanceProvider.dart';
import 'package:flutter/material.dart';

import 'Cycling_edit_distance_screen.dart';

class CyclingDistanceScreen extends StatefulWidget {
  const CyclingDistanceScreen({super.key});

  @override
  State<CyclingDistanceScreen> createState() => _CyclingDistanceScreenState();
}


class _CyclingDistanceScreenState extends State<CyclingDistanceScreen> {
  String? selectedDistance;

  Widget buildDistanceTile(String distance, {String? label, EdgeInsets? padding}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Provider.of<CyclingDistanceProvider>(context, listen: false).setDistance(distance);
        },
        child: Consumer<CyclingDistanceProvider>(
          builder: (context, distanceProvider, child) {
            final isSelected = distanceProvider.distance == distance;

            return Container(
              padding: padding ?? const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: AppGradients.greyTopTOBlackBottom,
                border: isSelected
                    ? Border.all(color: ColorUtils.appGreen.withOpacity(0.7), width: 1.3)
                    : Border.all(color: ColorUtils.white.withOpacity(0.3), width: 1.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "$distance Km",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: ColorUtils.white,
                    ),
                  ),
                  if (label != null)
                    TextWidget(
                      title: label,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.white,
                      fontWeight: FontWeight.w500,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CyclingDistanceProvider>(
      builder: (context, distanceProvider, child) {
        String? selectedDistance = distanceProvider.distance;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const VerticalSpace(height: 10),
                  GestureDetector(
                    onTap: () async {
                      final updatedDistance = await PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: CyclingEditDistanceScreen(),
                        withNavBar: false,
                      );
                      if (updatedDistance != null && updatedDistance != '') {
                        distanceProvider.setDistance(updatedDistance);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 5,right: 12,bottom: 6,top: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            selectedDistance?.isEmpty ?? true ? '--' : '$selectedDistance Km',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: ColorUtils.white,
                            ),
                          ),
                          HorizontalSpace(width: 10),
                          Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorUtils.white,
                            ),
                            child: Image.asset(
                              ImagesUtils.edit,
                              width: 15,
                              height: 15,
                              fit: BoxFit.fill,
                              color: ColorUtils.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalSpace(height: 20),

                  /// First Row
                  Row(
                    children: [
                      buildDistanceTile('0.80', label: 'Girl\'s Examination'),
                      const HorizontalSpace(width: 10),
                      buildDistanceTile('1.0', label: 'Men\'s Examination'),
                    ],
                  ),
                  const VerticalSpace(height: 10),

                  /// Second Row
                  Row(
                    children: [
                      buildDistanceTile('2.0',padding: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20)),
                      const HorizontalSpace(width: 10),
                      buildDistanceTile('3.0',padding: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20)),
                    ],
                  ),
                  const VerticalSpace(height: 10),

                  /// Third Row
                  Row(
                    children: [
                      buildDistanceTile('5.0',padding: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20)),
                      const HorizontalSpace(width: 10),
                      buildDistanceTile('10.0',padding: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20)),
                    ],
                  ),
                  const VerticalSpace(height: 10),

                  /// Fourth Row
                  Row(
                    children: [
                      buildDistanceTile('21.0975', label: 'Half-marathon'),
                      const HorizontalSpace(width: 10),
                      buildDistanceTile('42.159', label: 'Full-marathon'),
                    ],
                  ),
                  const VerticalSpace(height: 10),
                ],
              ),
            ),
            Spacer(),
            MyButton(
              height: 55,
              margin: const EdgeInsets.only(left: 15,right: 15),
              width: screenWidth(context),
              buttonTextColor: ColorUtils.black,
              navigateTo: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: RunningCountDown(),
                  withNavBar: false,
                );
              },
              buttonName: 'Start Cycling',
              buttonColor: ColorUtils.appGreen,
            ),
            VerticalSpace(height:40)
          ],
        );
      },
    );
  }
}


