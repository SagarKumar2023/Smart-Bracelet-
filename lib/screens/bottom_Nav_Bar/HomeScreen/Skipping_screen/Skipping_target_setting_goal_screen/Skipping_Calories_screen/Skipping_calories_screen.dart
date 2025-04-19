import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Cycling_screen/calories_target_setting_goal_screen/Cycling_Calories_screen/Cycling_caloriesProvider.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Cycling_screen/calories_target_setting_goal_screen/Cycling_time_screen/Cycling_edit_Time_screen.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Running_screen/Running_target_setting_goal_screen/Running_Calories_screen/Running_caloriesProvider.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Skipping_screen/Skipping_target_setting_goal_screen/Skipping_Calories_screen/Skipping_caloriesProvider.dart';
import 'package:x_fitness/widgets/my_Button.dart';

import '../../../Running_screen/Running_Start_Timer/RunningCountDown.dart';
import '../Skipping_time_screen/Skipping_edit_Time_screen.dart';
import 'Skipping_edit_Calories_screen.dart';

class SkippingCaloriesScreen extends StatefulWidget {
  const SkippingCaloriesScreen({super.key});

  @override
  State<SkippingCaloriesScreen> createState() => _SkippingCaloriesScreenState();
}

class _SkippingCaloriesScreenState extends State<SkippingCaloriesScreen> {
  String? selectedCalories;

  Widget buildCaloriesTile(String calories, ) {
    final isSelected = selectedCalories == calories;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCalories = calories;
            Provider.of<SkippingCaloriesProvider>(context, listen: false).setCalories(calories);
          });
        },
        child: Container(
          padding: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: AppGradients.greyTopTOBlackBottom,
            border: isSelected
                ? Border.all(color: ColorUtils.appGreen.withOpacity(0.7), width: 1.3)
                : Border.all(color: ColorUtils.white.withOpacity(0.3), width: 1.2),
          ),
          child: Center(
            child: Text(
              calories,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
                color: ColorUtils.white,
              ),
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<SkippingCaloriesProvider>(
      builder: (context, caloriesProvider, child) {
        String? selectedCalories = caloriesProvider.calories;
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
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: SkippingEditCaloriesScreen(),
                      withNavBar: false,
                    );
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
                          selectedCalories?.isEmpty ?? true ? '--' : '$selectedCalories Km',
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
                    buildCaloriesTile('150', ),
                    const HorizontalSpace(width: 10),
                    buildCaloriesTile('200',),
                  ],
                ),
                const VerticalSpace(height: 10),

                /// Second Row
                Row(
                  children: [
                    buildCaloriesTile('300'),
                    const HorizontalSpace(width: 10),
                    buildCaloriesTile('400'),
                  ],
                ),
                const VerticalSpace(height: 10),

                /// Third Row
                Row(
                  children: [
                    buildCaloriesTile('500'),
                    const HorizontalSpace(width: 10),
                    buildCaloriesTile('600'),
                  ],
                ),
              ],
            ),
          ),

          Spacer(),
          MyButton(
            height: 55,
            margin: const EdgeInsets.only(left: 15,right: 15),
            width: screenWidth(context),
            buttonTextColor: ColorUtils.black,
            navigateTo: (){
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: RunningCountDown(),
                withNavBar: false,
              );
            }, buttonName:'Start Skipping',buttonColor: ColorUtils.appGreen,),
          VerticalSpace(height:40)
        ],
      ) ;
    },);
  }
}
