import 'package:flutter/material.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/widgets/my_Text.dart';

class SelectDeviceTypeDesign extends StatelessWidget {
  final VoidCallback onTap;
  final String deviceTitle;
  final String deviceIcon;
  final Color? iconColor;
  const SelectDeviceTypeDesign({super.key, required this.onTap, required this.deviceTitle, required this.deviceIcon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: AppGradients.greyTopTOBlackBottom,
            border: Border.all(
                color: ColorUtils.white.withOpacity(
                  0.2,
                ),
                width: 1.3)),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ColorUtils.white,
                gradient: AppGradients.circleGradient
              ),
              child: Center(
                child: Image(image: AssetImage(deviceIcon),height: 27,color: iconColor,),
              ),
            ),
            HorizontalSpace(width: 15),
            TextWidget(
              title: deviceTitle,
              fontSize: 16,
              textAlign: TextAlign.center,
              textColor: ColorUtils.white.withOpacity(0.8),
              fontWeight: FontWeight.w300,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: ColorUtils.white.withOpacity(0.8),
            ),
          ],
        ),
      ),
    );
  }
}
