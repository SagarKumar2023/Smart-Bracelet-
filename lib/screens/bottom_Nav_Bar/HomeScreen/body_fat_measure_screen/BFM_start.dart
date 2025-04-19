import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Cycling_screen/calories_target_setting_goal_screen/cycling_target_setting_goal_screen.dart';
import 'package:x_fitness/widgets/back_button.dart';
import 'package:x_fitness/widgets/my_Text.dart';

import '../Running_screen/Running_Start_Timer/RunningCountDown.dart';

class BFMStart extends StatefulWidget {
  const BFMStart({super.key});

  @override
  State<BFMStart> createState() => _BFMStartState();
}

class _BFMStartState extends State<BFMStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.black,
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('Assets/background/Bodyfatmeasurebg2.png'),fit: BoxFit.fill)
        ),
        child: Container(
          height: screenHeight(context),
          width: screenWidth(context),
          color: ColorUtils.black.withOpacity(0.2),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 12,right: 12,top: 2,bottom: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyBackButton(onTap: (){Navigator.pop(context);}),
                      TextWidget(
                        title: 'Body Fat Measure',
                        fontSize: 18,
                        textAlign: TextAlign.center,
                        textColor: ColorUtils.white,
                        fontWeight: FontWeight.bold,
                      ),
                      Container(width: 50,)
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap:(){
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: RunningCountDown(),
                        withNavBar: false,
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorUtils.appGreen
                        ),
                        child: Center(
                          child:TextWidget(
                            title: 'Start',
                            fontSize: 18,
                            textAlign: TextAlign.center,
                            textColor: ColorUtils.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  VerticalSpace(height: 60)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
