import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:google_fonts/google_fonts.dart';
class MyButton extends StatelessWidget {
  final VoidCallback? navigateTo;
  final String buttonName;
  final double? height;
  final double? width;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final double? fontsize;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;

  const MyButton({
    super.key,
    required this.navigateTo,
    required this.buttonName,
    this.margin,
    this.height,
    this.width,
    this.buttonColor,
    this.fontsize,
    this.borderRadius,
    this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 45,
      margin: margin,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 45),
        color: buttonColor ?? ColorUtils.grey
      ),
      child: ElevatedButton(
        onPressed: navigateTo,
        style: ElevatedButton.styleFrom(
          surfaceTintColor: buttonColor ?? ColorUtils.grey,
          elevation: 0,
          backgroundColor: buttonColor ?? ColorUtils.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 45),
          ),
        ),
        child: Text(
          buttonName,
          style: GoogleFonts.robotoSlab(
            textStyle: TextStyle(
              color: buttonTextColor ?? ColorUtils.white,
              fontSize: fontsize ?? 16,
            ),
          ),
        ),
      ),
    );
  }
}

// class MyButton extends StatelessWidget {
//   final VoidCallback navigateTo;
//   final String buttonName;
//   final double? height;
//   final double? width;
//   final Color? buttonColor;
//   final Color? buttonTextColor;
//
//   final double? fontsize;
//   final double? borderRadius;
//   final EdgeInsetsGeometry? margin;
//   const MyButton({
//     super.key,
//     required this.navigateTo,
//     required this.buttonName,
//     this.margin,
//     this.height,
//     this.width,
//     this.buttonColor, this.fontsize, this.borderRadius, this.buttonTextColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height ?? 45,
//       margin: margin,
//       width: width ,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(45),
//       ),
//       child: ElevatedButton(
//         onPressed:()=>navigateTo,
//         style: ElevatedButton.styleFrom(
//             surfaceTintColor: buttonColor ?? ColorUtils.grey,
//             elevation: 0,
//             backgroundColor: buttonColor ?? ColorUtils.grey,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(borderRadius!),
//             )
//         ),
//         child: Text(
//           buttonName,
//           style: GoogleFonts.robotoSlab(
//               textStyle: TextStyle(
//             color: buttonTextColor??ColorUtils.white,
//                 fontSize: 16
//           )),
//         ),
//       ),
//     );
//   }
// }
