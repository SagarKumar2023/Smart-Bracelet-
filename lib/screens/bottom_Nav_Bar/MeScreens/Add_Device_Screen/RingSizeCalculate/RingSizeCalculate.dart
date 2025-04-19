import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ring_size_view/list_rings_sizer_country.dart';
import 'package:ring_size_view/model_gold_size.dart';
import 'package:ring_size_view/ring_size_view.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/widgets/back_button.dart';
import 'package:x_fitness/widgets/my_Text.dart';
import '../../../../../widgets/my_Button.dart';

  class Ringsizecalculate extends StatefulWidget {
    const Ringsizecalculate({super.key,});

    @override
    State<Ringsizecalculate> createState() => _RingsizecalculateState();
  }

  class _RingsizecalculateState extends State<Ringsizecalculate> {
    double ringSize = 6.0;
    double diameter = 0.0;
    double circumference = 0.0;
    ModelGoldSize modelGoldSize = ModelGoldSize();
    void updateMeasurements() {
      diameter = ringSize * 2;
      circumference = 2 * 3.1416 * ringSize;
    }

    @override
    void initState() {
      init();
      updateMeasurements();
      super.initState();
    }

    init(){
      modelGoldSize = ListRingsSizerCountry.getListSings();
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: ColorUtils.black,
        body: SafeArea(
          child: Container(
            height: screenHeight(context),
            width: screenWidth(context),
            decoration: BoxDecoration(
              // gradient:  AppGradients.blackToBlueGrey
              color: ColorUtils.white
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyBackButton(onTap: () => Navigator.pop(context)),
                            TextWidget(
                              title: 'Ring Size Finder',
                              fontSize: 18,
                              textAlign: TextAlign.center,
                              textColor: ColorUtils.black,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(width: 50),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                VerticalSpace(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color:Color(0xff000080).withOpacity(0.4) ,width: 1.4),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            title: 'Your Ring Size',
                            fontSize: 14,
                            textAlign: TextAlign.center,
                            textColor: ColorUtils.black,
                            fontWeight: FontWeight.bold,
                          ),
                          Image(
                            image: AssetImage('Assets/my_Icons/info.png'),
                            height: 15,
                            color: Color(0xff000080),
                          ),
                        ],
                      ),
                      VerticalSpace(height:5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              TextWidget(
                                  title: 'UK',
                                  fontSize: 13,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.black
                              ),
                              TextWidget(
                                  title: 'z+4',
                                  fontSize: 13,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextWidget(
                                  title: 'US',
                                  fontSize: 13,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.black,

                              ),
                              TextWidget(
                                  title: '28',
                                  fontSize: 13,
                                  textAlign: TextAlign.center,
                                  textColor:ColorUtils.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextWidget(
                                  title: 'EU',
                                  fontSize: 13,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.black
                              ),
                              TextWidget(
                                  title: '86',
                                  fontSize: 13,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                            decoration: BoxDecoration(
                             border: Border.all(color:ColorUtils.white.withOpacity(0.33) ,width: 1.2),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              children: [
                                TextWidget(
                                    title:'Diameter',
                                    fontSize: 13,
                                    textAlign: TextAlign.center,
                                    textColor: ColorUtils.black
                                ),
                                TextWidget(
                                    title: '${diameter.toStringAsFixed(2)} mm',
                                    fontSize: 13,
                                    textAlign: TextAlign.center,
                                    textColor:ColorUtils.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                VerticalSpace(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff000080).withOpacity(0.4), width: 1.4),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      setState(() {
                        ringSize -= details.primaryDelta! / 10;
                        if (ringSize < 6.0) ringSize = 6.0;
                        if (ringSize > 16.0) ringSize = 16.0;
                        updateMeasurements();
                      });
                    },
                    child: RingSizeView(
                      backgroundColor: Colors.transparent,
                      textStyle: TextStyle(fontWeight: FontWeight.bold, color: ColorUtils.appGreen),
                      ringSize: ringSize,
                      calculateDiameter: calculateDiameter,
                      calculateRadius: calculateRadius,
                      calculateCircumference: calculateCircumference,
                      height: screenHeight(context) * 0.3,
                      width: screenWidth(context),
                    ),
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.symmetric(horizontal: 10.0),
                //   decoration: BoxDecoration(
                //     border: Border.all(color:Color(0xff000080).withOpacity(0.4) ,width: 1.4),
                //     borderRadius: const BorderRadius.all(Radius.circular(10)),
                //   ),
                //   child: RingSizeView(
                //       backgroundColor: Colors.transparent,
                //       textStyle: TextStyle(fontWeight: FontWeight.bold,color: ColorUtils.appGreen),
                //       ringSize: ringSize,
                //       calculateDiameter: calculateDiameter,
                //       calculateRadius: calculateRadius,
                //       calculateCircumference: calculateCircumference,
                //       height:screenHeight(context)*0.3, width: screenWidth(context)
                //   ),
                // ),
                VerticalSpace(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color:Color(0xff000080).withOpacity(0.2) ,width: 1.4),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          TextWidget(
                              title: 'Radius',
                              fontSize: 14,
                              textAlign: TextAlign.center,
                              textColor: ColorUtils.black.withOpacity(0.7),
                          ),
                          TextWidget(
                              title: '${ringSize.toStringAsFixed(2)} mm',
                              fontSize: 13,
                              textAlign: TextAlign.center,
                              textColor: ColorUtils.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextWidget(
                              title:'Circumference',
                              fontSize: 14,
                              textAlign: TextAlign.center,
                            textColor: ColorUtils.black.withOpacity(0.7),
                          ),
                          TextWidget(
                              title: '${circumference.toStringAsFixed(2)} mm',
                              fontSize: 13,
                              textAlign: TextAlign.center,
                            textColor: ColorUtils.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                VerticalSpace(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical:1),
                  decoration: BoxDecoration(
                    border: Border.all(color:Color(0xff000080).withOpacity(0.2) ,width: 1.4),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Stack(
                    alignment:Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Slider(
                          thumbColor: Color(0xff000080),
                          activeColor: Color(0xff000080),
                          value: ringSize,
                          min: 6.0,
                          max: 16.0,
                          divisions: 20,
                          label: ringSize.toStringAsFixed(1),
                          onChanged: (double value) {
                            setState(() {
                              ringSize = value;
                              updateMeasurements();
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextWidget(
                              title: '12',
                              fontSize: 14,
                              textAlign: TextAlign.center,
                              textColor: ColorUtils.black,
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                              title: '32',
                              fontSize: 14,
                              textAlign: TextAlign.center,
                              textColor: ColorUtils.black,
                              fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                VerticalSpace(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ringSize = (ringSize - 0.5).clamp(6.0, 16.0);
                            updateMeasurements();
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff000080),
                          ),
                          child: Center(
                            child: Image(
                              image: AssetImage('Assets/my_Icons/minus.png'),
                              height: 20,
                              color: ColorUtils.white,
                            ),
                          ),
                        ),
                      ),

                      HorizontalSpace(width: 25),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                        decoration: BoxDecoration(
                          // color: ColorUtils.grey,
                          border: Border.all(
                            color: Color(0xff000080).withOpacity(0.33),
                            width: 1.2,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: TextWidget(
                          title: '${diameter.toStringAsFixed(2)} mm',
                          fontSize: 16,
                          textAlign: TextAlign.center,
                          textColor: ColorUtils.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      HorizontalSpace(width: 25),

                      // PLUS BUTTON
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            ringSize = (ringSize + 0.5).clamp(6.0, 16.0);
                            updateMeasurements();
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff000080),
                          ),
                          child: Center(
                            child: Image(
                              image: AssetImage('Assets/my_Icons/plus.png'),
                              height: 20,
                              color: ColorUtils.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalSpace(height: 30),
                MyButton(
                  margin: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                  navigateTo: ()async {
                    await Clipboard.setData(ClipboardData(text: ""
                        " circumference : ${circumference.toStringAsFixed(2)} mm"
                        "\n"
                        " diameter : ${diameter.toStringAsFixed(2)} mm"
                        "\n"
                        " radius : ${ringSize.toStringAsFixed(2)} mm"
                        ""));
                  },
                  buttonName:'COPY MY SIZE',
                  height: 50,
                  width: screenWidth(context),
                  buttonColor: Color(0xff000080),
                  borderRadius: 50,
                  buttonTextColor: ColorUtils.white,
                ),
                // Stack(
                //   children: [
                //     RulerPicker(
                //       controller: _controller,
                //       onValueChanged: (num value) {
                //         setState(() {
                //           diameter = value.toDouble();
                //           updateMeasurements();
                //         });
                //       },
                //       width: MediaQuery.of(context).size.width,
                //       height: 55,
                //       rulerMarginTop: 12,
                //       rulerBackgroundColor: Colors.transparent,
                //       rulerScaleTextStyle: TextStyle(
                //         color: Colors.white,
                //         fontSize: 16,
                //       ),
                //       onBuildRulerScaleText: (index, value) => value.toStringAsFixed(0),
                //       scaleLineStyleList: const [
                //         ScaleLineStyle(scale: 0, color: Colors.white, width: 2, height: 32),
                //         ScaleLineStyle(scale: 1, color: Colors.white, width: 1, height: 12),
                //         ScaleLineStyle(scale: 2, color: Colors.white, width: 1, height: 20),
                //         ScaleLineStyle(scale: 3, color: Colors.white, width: 1, height: 12),
                //         ScaleLineStyle(scale: 4, color: Colors.white, width: 1, height: 20),
                //         ScaleLineStyle(scale: 5, color: Colors.white, width: 1, height: 12),
                //         ScaleLineStyle(scale: 6, color: Colors.white, width: 1, height: 20),
                //         ScaleLineStyle(scale: 7, color: Colors.white, width: 1, height: 12),
                //         ScaleLineStyle(scale: 8, color: Colors.white, width: 1, height: 20),
                //         ScaleLineStyle(scale: 9, color: Colors.white, width: 1, height: 12),
                //       ],
                //       ranges: const [RulerRange(begin: 10, end: 28)],
                //       marker: Icon(Icons.arrow_drop_down, size: 32, color: Colors.red),
                //     ),
                //     Container(
                //       height:1.5,
                //       margin: EdgeInsets.only(top: 10),
                //       width: screenWidth(context),
                //       color: ColorUtils.white.withOpacity(0.4),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 60),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           GestureDetector(
                //             onTap: () {
                //               setState(() {
                //                 ringSize = (ringSize - 0.5).clamp(6.0, 16.0);
                //                 updateMeasurements();
                //               });
                //             },
                //             child: Container(
                //               height: 50,
                //               width: 50,
                //               decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: Color(0xff000080),
                //               ),
                //               child: Center(
                //                 child: Image(
                //                   image: AssetImage('Assets/my_Icons/minus.png'),
                //                   height: 20,
                //                   color: ColorUtils.white,
                //                 ),
                //               ),
                //             ),
                //           ),
                //
                //           HorizontalSpace(width: 25),
                //
                //           Container(
                //             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                //             decoration: BoxDecoration(
                //               // color: ColorUtils.grey,
                //               border: Border.all(
                //                 color: Color(0xff000080).withOpacity(0.33),
                //                 width: 1.2,
                //               ),
                //               borderRadius: const BorderRadius.all(Radius.circular(20)),
                //             ),
                //             child: TextWidget(
                //               title: '${diameter.toStringAsFixed(2)} mm',
                //               fontSize: 16,
                //               textAlign: TextAlign.center,
                //               textColor: ColorUtils.black,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //
                //           HorizontalSpace(width: 25),
                //
                //           // PLUS BUTTON
                //           GestureDetector(
                //             onTap: () {
                //               setState(() {
                //                 ringSize = (ringSize + 0.5).clamp(6.0, 16.0);
                //                 updateMeasurements();
                //               });
                //             },
                //             child: Container(
                //               height: 50,
                //               width: 50,
                //               decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: Color(0xff000080),
                //               ),
                //               child: Center(
                //                 child: Image(
                //                   image: AssetImage('Assets/my_Icons/plus.png'),
                //                   height: 20,
                //                   color: ColorUtils.white,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(top: 130),
                //       child: MyButton(
                //         margin: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                //         navigateTo: ()async {
                //           await Clipboard.setData(ClipboardData(text: ""
                //               " circumference : ${circumference.toStringAsFixed(2)} mm"
                //               "\n"
                //               " diameter : ${diameter.toStringAsFixed(2)} mm"
                //               "\n"
                //               " radius : ${ringSize.toStringAsFixed(2)} mm"
                //               ""));
                //         },
                //         buttonName:'COPY MY SIZE',
                //         height: 50,
                //         width: screenWidth(context),
                //         buttonColor: Color(0xff000080),
                //         borderRadius: 50,
                //         buttonTextColor: ColorUtils.white,
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ),
      );
    }


    calculateCircumference(value){
      circumference = value;
      print("Info calculateCircumference : $value");
    }
    calculateRadius(value){
      // ignore: avoid_print
      print("Info calculateRadius : $value");
    }
    calculateDiameter(value){
      diameter = value;
      print("Info calculateDiameter : $value");
    }
  }
