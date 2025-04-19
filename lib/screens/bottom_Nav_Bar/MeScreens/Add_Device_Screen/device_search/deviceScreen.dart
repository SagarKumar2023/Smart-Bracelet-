import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/MeScreens/Add_Device_Screen/device_search/connect_device_screen.dart';
import 'package:x_fitness/widgets/back_button.dart';
import 'package:x_fitness/widgets/my_Text.dart';

import '../select_device_type_screen.dart';


class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
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
              bottomLeft: Radius.circular(11),
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
                        title: 'Device',
                        fontSize: 18,
                        textAlign: TextAlign.center,
                        textColor: ColorUtils.white,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom:5),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: BoxDecoration(
          gradient: AppGradients.blackToBlueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 13),
                    padding: EdgeInsets.only(top: 6,left:6,right:10,bottom:6),
                    decoration: BoxDecoration(
                        gradient: AppGradients.greyTopTOBlackBottom,
                        border: Border.all(color: ColorUtils.white.withOpacity(0.2,),width: 1.3),
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AppGradients.circleGradient
                          ),
                          child: Image(image: AssetImage('Assets/my_Icons/headphone.png'),height: 15,),
                        ),
                        HorizontalSpace(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              title: 'Heart Rate Device',
                              fontSize: 15,
                              textAlign: TextAlign.start,
                              textColor: ColorUtils.white.withOpacity(0.9),
                              fontWeight: FontWeight.w300,
                            ),
                            Text('CL808-0619732',style: TextStyle(color: ColorUtils.white.withOpacity(0.7)),)
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: ConnectDeviceScreen(),
                              withNavBar: false,
                            );
                          },
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: AppGradients.buttonGradient,
                            ),
                            child: Center(
                              child: TextWidget(
                                title: 'Connect',
                                fontSize: 15,
                                textAlign: TextAlign.start,
                                textColor: ColorUtils.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            VerticalSpace(height: 10),
            GestureDetector(
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: SelectDeviceTypeScreen(),
                  withNavBar: false,
                );
              },
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
                decoration: DottedDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  shape: Shape.box,
                  strokeWidth: 1
                ),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('Assets/my_Icons/plus.png'),
                      height: 50,
                      width: 50,
                      color: Colors.greenAccent,
                    ),
                    VerticalSpace(height: 10),
                    TextWidget(
                      title: 'Add device',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.white.withOpacity(0.9),
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpace(height: 60)
          ],
        ),
      ),
    );
  }
}
