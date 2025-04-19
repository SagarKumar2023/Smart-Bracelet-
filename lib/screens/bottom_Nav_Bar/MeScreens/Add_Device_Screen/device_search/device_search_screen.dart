import 'package:flutter/material.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/widgets/back_button.dart';
import 'package:x_fitness/widgets/my_Button.dart';
import 'package:x_fitness/widgets/my_Text.dart';
import 'deviceScreen.dart';
import 'deviceSearch_Radar.dart';

class DeviceSearchScreen extends StatefulWidget {
  const DeviceSearchScreen({super.key});

  @override
  State<DeviceSearchScreen> createState() => _DeviceSearchScreenState();
}
class _DeviceSearchScreenState extends State<DeviceSearchScreen> {
  bool _isSearching = false;

  void _startSearch() async {
    setState(() {
      _isSearching = true;
    });

    await Future.delayed(Duration(seconds: 7));

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => DeviceScreen()),
      );
    }
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
                        title: 'Device Search',
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
            VerticalSpace(height: 160),
            Stack(
              alignment: Alignment.center,
              children: [
                if (_isSearching) DeviceSearchRadar(),
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
            ),
            VerticalSpace(height: 10),
            TextWidget(
              title: _isSearching ? 'Searching...' : '',
              fontSize: 18,
              textAlign: TextAlign.center,
              textColor: ColorUtils.white,
              fontWeight: FontWeight.bold,
            ),
            Spacer(),
            MyButton(
              navigateTo: _isSearching ? null : _startSearch,
              buttonName: 'Start Search',
              // borderRadius: 10,
              height: 50,
              width: screenWidth(context)*0.85,
              buttonColor: ColorUtils.appGreen,
              buttonTextColor: ColorUtils.black,
            ),
          ],
        ),
      ),
    );
  }
}


