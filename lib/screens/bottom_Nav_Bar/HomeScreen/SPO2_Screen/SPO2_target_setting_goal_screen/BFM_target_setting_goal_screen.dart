import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Running_screen/Running_target_setting_goal_screen/Running_Calories_screen/Running_calories_screen.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Running_screen/Running_target_setting_goal_screen/Running_distance_screen/Running_distance_screen.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Running_screen/Running_target_setting_goal_screen/Running_time_screen/Running_time_screen.dart';
import 'package:x_fitness/widgets/back_button.dart';
import 'package:x_fitness/widgets/my_Text.dart';


class SPO2TargetSettingGoalScreen extends StatefulWidget {
  const SPO2TargetSettingGoalScreen({super.key});

  @override
  State<SPO2TargetSettingGoalScreen> createState() => _SPO2TargetSettingGoalScreenState();
}

class _SPO2TargetSettingGoalScreenState extends State<SPO2TargetSettingGoalScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyBackButton(onTap: () => Navigator.pop(context)),
                    TextWidget(
                      title: 'Setting goals',
                      fontSize: 18,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.white,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 50), // to balance layout
                  ],
                ),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TabBar(
                  controller: tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: ColorUtils.white,
                  labelColor: ColorUtils.black,
                  dividerHeight: 0,
                  labelStyle: GoogleFonts.playfairDisplay(
                    textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  indicator: BoxDecoration(
                    color: ColorUtils.appGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tabs: const [
                    Tab(text: 'Distance'),
                    Tab(text: 'Time'),
                    Tab(text: 'Calories'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          RunningDistanceScreen(),
          RunningTimeScreen(),
          RunningCaloriesScreen(),
        ],
      ),
    );
  }
}
