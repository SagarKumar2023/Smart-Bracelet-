import 'package:flutter/material.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
class MyBackButton extends StatelessWidget {
  final VoidCallback onTap;
  const MyBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorUtils.white
        ),
        child: Center(
          child: Image(image: AssetImage(ImagesUtils.arrowBack),height: 20,),
        ),
      ),
    );
  }
}
