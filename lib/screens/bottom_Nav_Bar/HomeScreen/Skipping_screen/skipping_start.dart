import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/widgets/back_button.dart';
import 'package:x_fitness/widgets/my_Text.dart';

import '../../MeScreens/Add_Device_Screen/device_search/deviceScreen.dart';
import '../Running_screen/Running_Start_Timer/RunningCountDown.dart';
import 'Skipping_target_setting_goal_screen/Skipping_target_setting_goal_screen.dart';

class SkippingStart extends StatefulWidget {
  const SkippingStart({super.key});

  @override
  State<SkippingStart> createState() => _SkippingStartState();
}

class _SkippingStartState extends State<SkippingStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.black,
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: BoxDecoration(
          gradient: AppGradients.blackToBlueGrey,
            image: DecorationImage(image: AssetImage('Assets/background/Skippingbg.jpg'),fit: BoxFit.fill)
        ),
        child: Container(
          height: screenHeight(context),
          width: screenWidth(context),
          // color: ColorUtils.black.withOpacity(0.4),
            child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 12,right: 12,top: 2,bottom: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyBackButton(onTap: (){Navigator.pop(context);}),
                      TextWidget(
                        title: 'Skipping',
                        fontSize: 18,
                        textAlign: TextAlign.center,
                        textColor: ColorUtils.white,
                        fontWeight: FontWeight.bold,
                      ),
                      Container(width: 50,)
                    ],
                  ),
                  // Image(image: AssetImage(ImagesUtils.skippingStartBackground,),height: 500,width: screenWidth(context),),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap:(){
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: SkippingTargetSettingGoalScreen(),
                                withNavBar: false,
                              );
                            },
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorUtils.white
                              ),
                              child: Center(
                                child: Image(image: AssetImage(ImagesUtils.target),color: ColorUtils.black,height: 20,),
                              ),
                            ),
                          ),
                          VerticalSpace(height: 5),
                          TextWidget(
                            title: 'Target',
                            fontSize: 14,
                            textAlign: TextAlign.center,
                            textColor: ColorUtils.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
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

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap:(){
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: DeviceScreen(),
                                withNavBar: false,
                              );
                            },
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorUtils.white
                              ),
                              child: Center(
                                child: Image(image: AssetImage(ImagesUtils.device,),color: ColorUtils.black,height: 20,),
                              ),
                            ),
                          ),
                          VerticalSpace(height: 5),
                          TextWidget(
                            title: 'Device',
                            fontSize: 14,
                            textAlign: TextAlign.center,
                            textColor: ColorUtils.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )
                    ],
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