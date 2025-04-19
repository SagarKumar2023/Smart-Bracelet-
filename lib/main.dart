import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Cycling_screen/calories_target_setting_goal_screen/Cycling_Calories_screen/Cycling_caloriesProvider.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Cycling_screen/calories_target_setting_goal_screen/Cycling_distance_screen/Cycling_DistanceProvider.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Cycling_screen/calories_target_setting_goal_screen/Cycling_time_screen/Cycling_TimeProvider.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Running_screen/Running_target_setting_goal_screen/Running_Calories_screen/Running_caloriesProvider.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Running_screen/Running_target_setting_goal_screen/Running_distance_screen/Running_DistanceProvider.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Running_screen/Running_target_setting_goal_screen/Running_time_screen/Running_TimeProvider.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Skipping_screen/Skipping_target_setting_goal_screen/Skipping_Calories_screen/Skipping_caloriesProvider.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Skipping_screen/Skipping_target_setting_goal_screen/Skipping_distance_screen/Skipping_DistanceProvider.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/HomeScreen/Skipping_screen/Skipping_target_setting_goal_screen/Skipping_time_screen/Skipping_TimeProvider.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/bottom_Nav_Bar.dart';
import 'package:x_fitness/theme/ThemeProvider.dart';
import 'package:x_fitness/theme/dark_theme.dart';
import 'package:x_fitness/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(sharedPreferences: prefs)),
        ChangeNotifierProvider(create: (_) => CyclingDistanceProvider()),
        ChangeNotifierProvider(create: (_) => CyclingTimeProvider()),
        ChangeNotifierProvider(create: (_) => CyclingCaloriesProvider()),
        ChangeNotifierProvider(create: (_) => RunningDistanceProvider()),
        ChangeNotifierProvider(create: (_) => RunningTimeProvider()),
        ChangeNotifierProvider(create: (_) => RunningCaloriesProvider()),
        ChangeNotifierProvider(create: (_) => SkippingDistanceProvider()),
        ChangeNotifierProvider(create: (_) => SkippingTimeProvider()),
        ChangeNotifierProvider(create: (_) => SkippingCaloriesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Smart Bracelet',
          theme: themeProvider.darkTheme ? dark : light,
          home: BottomNavBar(),
        );
      },
    );
  }
}
