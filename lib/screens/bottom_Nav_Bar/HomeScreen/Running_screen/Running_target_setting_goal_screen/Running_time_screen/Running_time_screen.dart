
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Cycling_screen/calories_target_setting_goal_screen/Cycling_time_screen/Cycling_edit_Time_screen.dart';
import 'package:x_fitness/widgets/my_Button.dart';
import '../../Running_Start_Timer/RunningCountDown.dart';
import 'Running_TimeProvider.dart';
import 'Running_edit_Time_screen.dart';

class RunningTimeScreen extends StatefulWidget {
  const RunningTimeScreen({super.key});

  @override
  State<RunningTimeScreen> createState() => _RunningTimeScreenState();
}

class _RunningTimeScreenState extends State<RunningTimeScreen> {
  String? selectedTime;

  Widget buildDistanceTile(String distance) {
    final isSelected = selectedTime == distance;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTime = distance;
            Provider.of<RunningTimeProvider>(context, listen: false).setTime(distance);
          });
        },
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: AppGradients.greyTopTOBlackBottom,
            border: isSelected
                ?Border.all(color: ColorUtils.appGreen.withOpacity(0.7), width: 1.3)
                : Border.all(color: ColorUtils.white.withOpacity(0.3), width: 1.2),
          ),
          child: Center(
            child: Text(
              distance,
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
    final savedTime = Provider.of<RunningTimeProvider>(context).savedTime;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const VerticalSpace(height: 10),
              GestureDetector(
                onTap: ()  {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: RunningEditTimeScreen(),
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
                        savedTime?.isEmpty ?? true ? '--' : savedTime,
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
              // First Row
              Row(
                children: [
                  buildDistanceTile('00:01:00'),
                  const HorizontalSpace(width: 10),
                  buildDistanceTile('00:15:00'),
                ],
              ),
              const VerticalSpace(height: 10),

              // Second Row
              Row(
                children: [
                  buildDistanceTile('00:30:00'),
                  const HorizontalSpace(width: 10),
                  buildDistanceTile('00:40:00'),
                ],
              ),
              const VerticalSpace(height: 10),

              // Third Row
              Row(
                children: [
                  buildDistanceTile('00:50:00'),
                  const HorizontalSpace(width: 10),
                  buildDistanceTile('01:00:00'),
                ],
              ),
            ],
          ),
        ),
        Spacer(),
        MyButton(
          margin: const EdgeInsets.only(left: 15, right: 15),
          width: screenWidth(context),
          buttonTextColor: ColorUtils.black,
          navigateTo: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: RunningCountDown(),
              withNavBar: false,
            );
          },
          buttonName: 'Start Running',
          // borderRadius: 10,
          height: 55,
          buttonColor: ColorUtils.appGreen,
        ),
        VerticalSpace(height: 40),
      ],
    );
  }
}
