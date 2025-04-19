import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/widgets/back_button.dart';
import 'package:x_fitness/widgets/my_Text.dart';
import '../../../../../constant/screen_Size.dart';
import 'Skipping_Calories_screen/Skipping_calories_screen.dart';
import 'Skipping_distance_screen/Skipping_distance_screen.dart';
import 'Skipping_time_screen/Skipping_time_screen.dart';


class SkippingTargetSettingGoalScreen extends StatefulWidget {
  const SkippingTargetSettingGoalScreen({super.key});

  @override
  State<SkippingTargetSettingGoalScreen> createState() => _SkippingTargetSettingGoalScreenState();
}

class _SkippingTargetSettingGoalScreenState extends State<SkippingTargetSettingGoalScreen> with SingleTickerProviderStateMixin {
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
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: BoxDecoration(
            gradient: AppGradients.blackToBlueGrey
        ),
        child: TabBarView(
          controller: tabController,
          children: const [
            SkippingDistanceScreen(),
            SkippingTimeScreen(),
            SkippingCaloriesScreen(),
          ],
        ),
      ),
    );
  }
}
