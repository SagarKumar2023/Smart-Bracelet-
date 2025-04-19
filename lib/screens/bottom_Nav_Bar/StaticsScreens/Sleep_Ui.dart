import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/MeScreens/Add_Device_Screen/device_search/deviceScreen.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/MeScreens/Add_Device_Screen/device_search/device_search_screen.dart';
import 'package:x_fitness/widgets/my_Button.dart';
import 'package:x_fitness/widgets/my_Text.dart';
class SleepUi extends StatelessWidget {
  const SleepUi({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: AppGradients.greyTopTOBlackBottom,
          border: Border.all(color: ColorUtils.white.withOpacity(0.3),width: 1.1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            title: 'Sleep',
            fontSize: 16,
            textAlign: TextAlign.start,
            textColor: ColorUtils.white,
            fontWeight: FontWeight.w600,
          ),
          VerticalSpace(height: 15),
          MyButton(navigateTo: (){
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: DeviceSearchScreen(),
              withNavBar: false,
            );
          }, buttonName: 'Device Not Connected',borderRadius: 10,buttonColor: ColorUtils.appGreen,buttonTextColor: ColorUtils.black,width: screenWidth(context),)
        ],
      ),
    );
  }
}
