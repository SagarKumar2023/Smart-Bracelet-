import 'package:flutter/material.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/spacer.dart';

import '../../../../constant/images.dart';
import '../../../../widgets/my_Text.dart';
class StaticsScreensDesign extends StatelessWidget {
  final String titleOne;
  final Color titleOneBorderColor;
  final String titleOneBgImage;
  final VoidCallback titleOneOnTap;
  final String titleTwo;
  final String titleTwoBgImage;
  final Color titleTwoBorderColor;
  final VoidCallback titleTwoOnTap;
  const StaticsScreensDesign({super.key, required this.titleOne, required this.titleOneBgImage, required this.titleOneOnTap, required this.titleTwo, required this.titleTwoBgImage, required this.titleTwoOnTap, required this.titleOneBorderColor, required this.titleTwoBorderColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: titleOneOnTap,
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: titleOneBorderColor,width: 1.3),
                  image: DecorationImage(image: AssetImage(titleOneBgImage),fit: BoxFit.fill)
              ),
              child: Container(
                height: 110,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: ColorUtils.black.withOpacity(0.5)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorUtils.white,
                        ),
                        child: Image.asset(
                          ImagesUtils.arrow,
                          width: 20,
                          height: 20,
                          fit: BoxFit.fill,
                          color: ColorUtils.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child:  TextWidget(
                        title: titleOne,
                        fontSize: 16,
                        textAlign: TextAlign.center,
                        textColor: ColorUtils.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        HorizontalSpace(width: 10),
        Expanded(
          child: GestureDetector(
            onTap:titleTwoOnTap,
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color:titleTwoBorderColor,width: 1.3),
                  image: DecorationImage(image: AssetImage(titleTwoBgImage),fit: BoxFit.fill)
              ),
              child: Container(
                height: 110,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: ColorUtils.black.withOpacity(0.5)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorUtils.white,
                        ),
                        child: Image.asset(
                          ImagesUtils.arrow,
                          width: 20,
                          height: 20,
                          fit: BoxFit.fill,
                          color: ColorUtils.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child:  TextWidget(
                        title: titleTwo,
                        fontSize: 16,
                        textAlign: TextAlign.center,
                        textColor: ColorUtils.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
