import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/MeScreens/Add_Device_Screen/device_search/device_search_screen.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/MeScreens/Add_Device_Screen/select_device_type_design.dart';
import 'package:x_fitness/widgets/back_button.dart';
import 'package:x_fitness/widgets/my_Text.dart';



class SelectDeviceTypeScreen extends StatefulWidget {
  const SelectDeviceTypeScreen({super.key});

  @override
  State<SelectDeviceTypeScreen> createState() => _SelectDeviceTypeScreenState();
}

class _SelectDeviceTypeScreenState extends State<SelectDeviceTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(66),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(11),
              bottomLeft: Radius.circular(11)
            ),
          ),
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
                        title: 'Select Device Type',
                        fontSize: 18,
                        textAlign: TextAlign.center,
                        textColor: ColorUtils.white,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(width: 50), // to balance layout
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: BoxDecoration(
            gradient: AppGradients.blackToBlueGrey
        ),
        child: Column(
          children: [
            SelectDeviceTypeDesign(
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: DeviceSearchScreen(),
                  withNavBar: false,
                );
              },
              deviceTitle:'HR Sensor' ,
              deviceIcon: ImagesUtils.hrSensor,
            ),
            VerticalSpace(height: 13),
            SelectDeviceTypeDesign(
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: DeviceSearchScreen(),
                  withNavBar: false,
                );
              },
              deviceTitle:'Wristband' ,
              deviceIcon: ImagesUtils.wristband,
            ),
            VerticalSpace(height: 13),
            SelectDeviceTypeDesign(
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: DeviceSearchScreen(),
                  withNavBar: false,
                );
              },
              deviceTitle:'Watch' ,
              deviceIcon: ImagesUtils.watchIcon,
            ),
            VerticalSpace(height: 13),
            SelectDeviceTypeDesign(
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: DeviceSearchScreen(),
                  withNavBar: false,
                );
              },
              deviceTitle:'Skipping' ,
              deviceIcon: ImagesUtils.skippingIcon,
            ),
            VerticalSpace(height: 13),
            SelectDeviceTypeDesign(
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: DeviceSearchScreen(),
                  withNavBar: false,
                );
              },
              deviceTitle:'Cycling' ,
              deviceIcon: ImagesUtils.cyclingIcon,
            ),
            VerticalSpace(height: 13),
            SelectDeviceTypeDesign(
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: DeviceSearchScreen(),
                  withNavBar: false,
                );
              },
              deviceTitle:'Spo2' ,
              deviceIcon: ImagesUtils.spo2Icon,
            ),
          ],
        ),
      ),
    );
  }
}
