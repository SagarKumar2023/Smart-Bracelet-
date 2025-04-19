import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/HomeScreen.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/MeScreens/MeScreens.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/StaticsScreens/StaticsScreens.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      Homescreen(),
      StaticsScreen(),
      MeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon:ImageIcon(AssetImage(ImagesUtils.homeIcon),size: 20,),
        title: "Home",
        textStyle: GoogleFonts.playfairDisplay(),
        activeColorPrimary: ColorUtils.appGreen,
        inactiveColorPrimary: ColorUtils.white,
      ),
      PersistentBottomNavBarItem(
        icon:ImageIcon(AssetImage(ImagesUtils.staticsIcon),size: 20,),
        title: "Statistics",
        textStyle: GoogleFonts.playfairDisplay(),
        activeColorPrimary: ColorUtils.appGreen,
        inactiveColorPrimary: ColorUtils.white,
      ),
      PersistentBottomNavBarItem(
        icon:ImageIcon(AssetImage(ImagesUtils.meIcon),size: 20,),
        title: "Me",
        textStyle: GoogleFonts.playfairDisplay(),
        activeColorPrimary: ColorUtils.appGreen,
        inactiveColorPrimary: ColorUtils.white,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F4F4F),
      body: PersistentTabView(
        padding: EdgeInsets.zero,
        // margin: EdgeInsets.all(10),
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        // backgroundColor: Color(0xff3F403D),
        backgroundColor: Color(0xff2F4F4F),
        navBarHeight: 60,
        navBarStyle: NavBarStyle.style1,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(13),topRight: Radius.circular(13))
        ),
      ),
    );
  }
}
