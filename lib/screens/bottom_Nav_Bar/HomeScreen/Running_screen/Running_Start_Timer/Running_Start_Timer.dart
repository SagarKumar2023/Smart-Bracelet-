// import 'package:flutter/material.dart';
// import 'package:x_fitness/constant/color_Utils.dart';
// import 'package:x_fitness/constant/images.dart';
// import 'package:x_fitness/constant/spacer.dart';
//
// import '../../../../../widgets/Myback_button.dart';
// import '../../../../../widgets/my_Text.dart';
//
// class RunningStartTimerScreen extends StatefulWidget {
//   const RunningStartTimerScreen({super.key});
//
//   @override
//   State<RunningStartTimerScreen> createState() => _RunningStartTimerScreenState();
// }
//
// class _RunningStartTimerScreenState extends State<RunningStartTimerScreen> {
//   bool isCheckedIn = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorUtils.black,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   MyBackButton(onTap: (){Navigator.pop(context);}),
//                   TextWidget(
//                     title: 'Running',
//                     fontSize: 18,
//                     textAlign: TextAlign.center,
//                     textColor: ColorUtils.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   Container(width: 50,)
//                 ],
//               ),
//               VerticalSpace(height: 15),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.only(left: 8,right: 8,top: 12,bottom: 12),
//                 decoration: BoxDecoration(
//                   // color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(
//                     color: ColorUtils.white.withOpacity(0.4),width: 1.2,
//                   ),
//                 ),
//                 child:Column(
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           flex: 1,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Container(
//                                 height: 45,
//                                 width: 45,
//                                 decoration: BoxDecoration(
//                                   gradient: AppGradients.circleGradient,
//                                   borderRadius:
//                                   BorderRadius.circular(23),
//                                 ),
//                                 child: Center(
//                                     child: ImageIcon(
//                                       AssetImage(ImagesUtils.hrSensor),
//                                       size: 30,
//                                       color: Colors.red,
//                                     )),
//                               ),
//                               HorizontalSpace(width:8),
//                               TextWidget(
//                                 title: '0',
//                                 fontSize: 25,
//                                 textAlign: TextAlign.center,
//                                 textColor: ColorUtils.red,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           flex: 1,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Container(
//                                 height: 45,
//                                 width: 45,
//                                 decoration: BoxDecoration(
//                                   gradient: AppGradients.circleGradient,
//                                   borderRadius:
//                                   BorderRadius.circular(23),
//                                 ),
//                                 child: Center(
//                                     child: ImageIcon(
//                                       AssetImage(ImagesUtils.cyclingIcon),
//                                       size: 30,
//                                         color: Colors.orange                                  )),
//                               ),
//                               HorizontalSpace(width:8),
//                               TextWidget(
//                                 title: '0',
//                                 fontSize: 25,
//                                 textAlign: TextAlign.center,
//                                 textColor: Colors.orange ,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                    VerticalSpace(height: 12),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           flex: 1,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Container(
//                                 height: 45,
//                                 width: 45,
//                                 decoration: BoxDecoration(
//                                   gradient: AppGradients.circleGradient,
//                                   borderRadius:
//                                   BorderRadius.circular(23),
//                                 ),
//                                 child: Center(child: Icon(Icons.location_on_outlined,color: Colors.greenAccent,),),
//
//                               ),
//                               HorizontalSpace(width:8),
//                               TextWidget(
//                                 title: '0.00',
//                                 fontSize: 25,
//                                 textAlign: TextAlign.center,
//                                 textColor: Colors.greenAccent,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           flex: 1,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Container(
//                                 height: 45,
//                                 width: 45,
//                                 decoration: BoxDecoration(
//                                   gradient: AppGradients.circleGradient,
//                                   borderRadius:
//                                   BorderRadius.circular(23),
//                                 ),
//                                 child: Center(child: Icon(Icons.timer_sharp,color: Colors.blue,),),
//
//                               ),
//                               HorizontalSpace(width:8),
//                               TextWidget(
//                                 title: '00:00:00', /// hh:mm:ss hour,minute ,second
//                                 fontSize: 25,
//                                 textAlign: TextAlign.center,
//                                 textColor: Colors.blue ,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               VerticalSpace(height: 20,),
//               Container(
//                 padding: const EdgeInsets.all(12.0),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: ColorUtils.white.withOpacity(0.4),width: 1.2,
//                   ),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           height: 25,
//                           width: 5,
//                           decoration: BoxDecoration(
//                               color: Colors.greenAccent,
//                               borderRadius: BorderRadius.all(Radius.circular(3))
//                           ),
//                         ),
//                         SizedBox(width: 5,),
//                         TextWidget(
//                           title: 'Heart Rate Zone Chart',
//                           fontSize: 15,
//                           textAlign: TextAlign.center,
//                           textColor: ColorUtils.white,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                     VerticalSpace(height: 15,),
//                     SizedBox(
//                       height: 200,
//                       child: Center(
//                         child:TextWidget(
//                           title: 'Graph Space',
//                           fontSize: 12,
//                           textAlign: TextAlign.center,
//                           textColor: ColorUtils.white,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Spacer(),
//               Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     /// Start pe Click kare to time start ho jana chaiye
//                     /// or start button ke place pe
//                   },
//                   child: Container(
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       color:Colors.greenAccent,
//                     ),
//                     child: Center(
//                       child: TextWidget(
//                         title: 'Start',
//                         fontSize: 20,
//                         textAlign: TextAlign.center,
//                         textColor: ColorUtils.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               /// ye row display hona chiye
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       /// Pause pe Click kare to time stop ho jana chaiye
//                       /// ye pura row ke blacke start  button display hona chaiye
//                     },
//                     child: Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         color:Colors.greenAccent,
//                       ),
//                       child: Center(
//                         child: TextWidget(
//                           title: 'Pause',
//                           fontSize: 20,
//                           textAlign: TextAlign.center,
//                           textColor: ColorUtils.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       /// Save pe Click kare to ek dialog open hoga user ok karega to
//                       /// time ko store kar ke rakh lena hai
//                     },
//                     child: Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(50),
//                         color:Colors.greenAccent,
//                       ),
//                       child: Center(
//                         child: TextWidget(
//                           title: 'Save',
//                           fontSize: 20,
//                           textAlign: TextAlign.center,
//                           textColor: ColorUtils.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               VerticalSpace(height: 50),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//

import 'package:scale_button/scale_button.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/spacer.dart';
import '../../../../../widgets/Myback_button.dart';
import '../../../../../widgets/my_Text.dart';

class RunningStartTimerScreen extends StatefulWidget {
  const RunningStartTimerScreen({super.key});

  @override
  State<RunningStartTimerScreen> createState() => _RunningStartTimerScreenState();
}

class _RunningStartTimerScreenState extends State<RunningStartTimerScreen> {
  bool isRunning = false;
  Duration duration = Duration.zero;
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        duration += Duration(seconds: 1);
      });
    });
    setState(() {
      isRunning = true;
    });
  }

  void pauseTimer() {
    _timer?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void saveSession() {
    _timer?.cancel();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.all(0),
        backgroundColor: ColorUtils.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        content:  Container(
          height: 115,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextWidget(
                  title: 'Do you want to save this exercise record',
                  fontSize: 18,
                  textAlign: TextAlign.center,
                  textColor: ColorUtils.black.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Divider(color: ColorUtils.black.withOpacity(0.3),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: TextWidget(
                      title: 'Cancel',
                      fontSize: 18,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.black.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  VerticalDivider(width: 1.2,color: ColorUtils.black.withOpacity(0.3),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Exercise saved')),
                      );
                      setState(() {
                        duration = Duration.zero;
                        isRunning = false;
                      });
                    },
                    child: TextWidget(
                      title: 'Save',
                      fontSize: 18,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.black.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        // actions: [
        //
        //   TextButton(
        //     onPressed: () => Navigator.pop(context),
        //     child: Text('Cancel'),
        //   ),
        //   TextButton(
        //     onPressed: () {
        //       // Add your saving logic here (e.g. local DB or API)
        //       Navigator.pop(context);
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(content: Text('Session saved!')),
        //       );
        //       setState(() {
        //         duration = Duration.zero;
        //         isRunning = false;
        //       });
        //     },
        //     child: Text('OK'),
        //   ),
        // ],
      ),
    );
  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inHours)}:${twoDigits(d.inMinutes % 60)}:${twoDigits(d.inSeconds % 60)}";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyBackButton(onTap: () => Navigator.pop(context)),
                  TextWidget(
                    title: 'Running',
                    fontSize: 18,
                    textAlign: TextAlign.center,
                    textColor: ColorUtils.white,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 50),
                ],
              ),
              VerticalSpace(height: 15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: ColorUtils.white.withOpacity(0.4), width: 1.2,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildMetricItem(
                          icon: ImageIcon(AssetImage(ImagesUtils.hrSensor), color: Colors.red),
                          label: '0',
                          color: Colors.red,
                        ),
                        buildMetricItem(
                          icon: ImageIcon(AssetImage(ImagesUtils.cyclingIcon), color: Colors.orange),
                          label: '0',
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    VerticalSpace(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildMetricItem(
                          icon: Icon(Icons.location_on_outlined, color: Colors.greenAccent),
                          label: '0.00',
                          color: Colors.greenAccent,
                        ),
                        buildMetricItem(
                          icon: Icon(Icons.timer_sharp, color: Colors.blue),
                          label: formatDuration(duration),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              VerticalSpace(height: 20),
              Container(
                padding: const EdgeInsets.all(12.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorUtils.white.withOpacity(0.4), width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 5,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        SizedBox(width: 5),
                        TextWidget(
                          title: 'Heart Rate Zone Chart',
                          fontSize: 15,
                          textAlign: TextAlign.center,
                          textColor: ColorUtils.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    VerticalSpace(height: 15),
                    SizedBox(
                      height: 200,
                      child: Center(
                        child: TextWidget(
                          title: 'Graph Space',
                          fontSize: 12,
                          textAlign: TextAlign.center,
                          textColor: ColorUtils.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              !isRunning
                  ? Center(
                child: circularButton('Start',() => startTimer(),),
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  circularButton('Pause',() => pauseTimer(),),
                  circularButton('Save',() => saveSession(),),
                ],
              ),
              VerticalSpace(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMetricItem({required Widget icon, required String label, required Color color}) {
    return Expanded(
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              gradient: AppGradients.circleGradient,
              borderRadius: BorderRadius.circular(23),
            ),
            child: Center(child: icon),
          ),
          HorizontalSpace(width: 8),
          TextWidget(
            title: label,
            fontSize: 25,
            textAlign: TextAlign.center,
            textColor: color,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget circularButton(String title,VoidCallback onTap) {
    return ScaleButton(
      reverse: true,
      duration: Duration(seconds: 1),
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.greenAccent,
        ),
        child: Center(
          child: TextWidget(
            title: title,
            fontSize: 20,
            textAlign: TextAlign.center,
            textColor: ColorUtils.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
