// import 'package:flutter/material.dart';
// import 'package:x_fitness/constant/color_Utils.dart';
// import 'package:x_fitness/constant/images.dart';
// import 'package:x_fitness/constant/screen_Size.dart';
// import 'package:x_fitness/widgets/my_Button.dart';
// import 'package:x_fitness/widgets/my_Text.dart';
// class FitnessTypeUi extends StatelessWidget {
//   final String fitnessTitle;
//   final String fitnessImage;
//   final VoidCallback onTap;
//   const FitnessTypeUi({super.key, required this.fitnessTitle, required this.fitnessImage, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: screenWidth(context),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Stack(
//           children: [
//             Container(
//               width: screenWidth(context),
//               margin: EdgeInsets.only(top: 30),
//               padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: ColorUtils.orange
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 70),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           TextWidget(
//                             title: fitnessTitle.toUpperCase(),
//                             fontSize: 14,
//                             textAlign: TextAlign.center,
//                             textColor: ColorUtils.white,
//                             letterSpacing: 1,
//                           ),
//                           Spacer(),
//                           Container(
//                             height: 35,
//                             width: 90,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(7),
//                               gradient: RadialGradient(
//                                 center: const Alignment(-0.86, -0.73),
//                                 radius: 1.0,
//                                 focal: const Alignment(-0.86, -0.73),
//                                 focalRadius: 0.001,
//                                 colors: [
//                                   Color.fromRGBO(37, 249, 245, 1),
//                                   Color.fromRGBO(8, 70, 218, 1),
//                                 ],
//                                 stops: [0.0, 0.9],
//                               ),
//                             ),
//                             child: Image(image: AssetImage(ImagesUtils.arrowForward),width: 80,fit: BoxFit.fill,),
//                           ),
//                          // MyButton(
//                          //   navigateTo: (){},
//                          //   buttonName: 'Start',
//                          //   height: 35,
//                          //   width: 100,
//                          //   borderRadius: 7,
//                          // )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 85,
//               width: 90,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   // color: ColorUtils.orange,
//                   image: DecorationImage(image: AssetImage(fitnessImage),fit: BoxFit.contain)
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
///
// import 'package:flutter/material.dart';
// import 'package:x_fitness/constant/color_Utils.dart';
// import 'package:x_fitness/constant/images.dart';
// import 'package:x_fitness/constant/screen_Size.dart';
// import 'package:x_fitness/constant/spacer.dart';
// import 'package:x_fitness/widgets/my_Button.dart';
// import 'package:x_fitness/widgets/my_Text.dart';
// class FitnessTypeUi extends StatelessWidget {
//   final String title;
//   final String leading;
//   final VoidCallback onTap;
//   const FitnessTypeUi({super.key, required this.title, required this.onTap, required this.leading});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: screenWidth(context),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child:Container(
//             width: screenWidth(context),
//             margin: EdgeInsets.only(top: 10),
//             padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: ColorUtils.white.withOpacity(0.2),width: 1.3)
//             ),
//             child:Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image(image: AssetImage(leading),width:35,height: 35,fit: BoxFit.fill,color: ColorUtils.green,),
//                 HorizontalSpace(width: 8),
//                 TextWidget(
//                   title: title.toUpperCase(),
//                   fontSize: 14,
//                   textAlign: TextAlign.center,
//                   textColor: ColorUtils.white,
//                   letterSpacing: 1,
//                 ),
//                 Spacer(),
//                 Image(image: AssetImage(ImagesUtils.arrowForward),width: 55,height: 30,fit: BoxFit.fill,color: ColorUtils.white,),
//
//               ],
//             )
//         ),
//       ),
//     );
//   }
// }
///
import 'package:flutter/material.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/widgets/my_Text.dart';

class FitnessTypeUi extends StatelessWidget {
  final String title;
  final String leading;
  final VoidCallback onTap;
  final Color indicatorColor;
  final Color borderColor;
  final Color iconColor;
  final Color titleColor;

  const FitnessTypeUi({super.key, required this.title, required this.onTap, required this.leading, required this.indicatorColor, required this.borderColor, required this.iconColor, required this.titleColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(left: 5,right: 15,top: 5,bottom:5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: indicatorColor,
              border: Border.all(color: borderColor,width: 1.3)
          ),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorUtils.white
                  ),
                  child: Image(image: AssetImage(leading),width:20,height:20,fit: BoxFit.fill,color: iconColor,)),
              HorizontalSpace(width: 10),
              TextWidget(
                title: title,
                fontSize: 14,
                textAlign: TextAlign.center,
                textColor: titleColor,
              ),
            ],
          )
      ),
    );
  }
}