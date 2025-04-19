import 'package:flutter/material.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/widgets/back_button.dart';
import 'package:x_fitness/widgets/my_Button.dart';
import 'package:x_fitness/widgets/my_Text.dart';
import '../../../bottom_Nav_Bar.dart';
import 'deviceSearch_Radar.dart';

class ConnectDeviceScreen extends StatefulWidget {
  const ConnectDeviceScreen({super.key});

  @override
  State<ConnectDeviceScreen> createState() => _ConnectDeviceScreenState();
}

class _ConnectDeviceScreenState extends State<ConnectDeviceScreen> {
  bool _showRadar = true;
  bool _isSearching = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 7), () {
      setState(() {
        _showRadar = false;
        _isSearching = false;
      });
    });
  }

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
                        title: 'Connecting Devices',
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
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 50),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: BoxDecoration(
          gradient: AppGradients.blackToBlueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showRadar? VerticalSpace(height: 160):VerticalSpace(height: 80),
            _showRadar
                ? Stack(
              alignment: Alignment.center,
              children: [
                DeviceSearchRadar(),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFFF720),
                        Color(0xFF3CD500),
                      ],
                      stops: [0.1, 1.0],
                    ),
                  ),
                  child: Icon(Icons.bluetooth, size: 50, color: ColorUtils.white),
                ),
              ],
            )
                : Column(
              children: [
                Image(
                  image: AssetImage(ImagesUtils.smartBand),
                  height: 300,
                ),
                VerticalSpace(height: 50),
                TextWidget(
                  title: 'CL808-0619732',
                  fontSize: 18,
                  textAlign: TextAlign.center,
                  textColor: ColorUtils.white,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const Spacer(),
            MyButton(
              navigateTo: () {
                if (_isSearching) {
                  Navigator.pop(context);
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()),
                  );
                }
              },
              buttonName: _isSearching ? 'Cancel Connect' : 'Connect',
              height: 55,
              width: screenWidth(context) * 0.85,
              buttonColor: ColorUtils.appGreen,
              buttonTextColor: ColorUtils.black,
            ),
          ],
        ),
      ),
    );
  }
}
