import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/MeScreens/Add_Device_Screen/select_device_type_screen.dart';
import 'package:x_fitness/screens/bottom_Nav_Bar/MeScreens/user_info_screen.dart';
import 'package:x_fitness/widgets/my_Text.dart';
class MeScreen extends StatefulWidget {
  const MeScreen({super.key});

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              )
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorUtils.white,
                      ),
                      child: Image(image: AssetImage(ImagesUtils.menu),height: 10,),
                    ),
                    TextWidget(
                      title: 'Personal Center',
                      fontSize: 18,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.white,
                      fontWeight: FontWeight.bold,
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorUtils.white,
                      ),
                      child: Icon(
                        Icons.settings_outlined,
                        size:20,
                        color: ColorUtils.black,
                      ),
                    ),
                  ],
                ),
                VerticalSpace(height: 10),
                Container(
                  padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: ColorUtils.white.withOpacity(0.2,),width: 1.3)
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: UserInfoScreen(),
                            withNavBar: false,
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: ColorUtils.white,
                            image: DecorationImage(fit: BoxFit.fill,image:  AssetImage('Assets/background/user.jpg'))
                          ),
                        ),
                      ),
                      HorizontalSpace(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            title: 'L1',
                            fontSize: 14,
                            textAlign: TextAlign.center,
                            textColor: ColorUtils.white.withOpacity(0.8),
                            fontWeight: FontWeight.w600,
                          ),
                          Text('0/400',style: TextStyle(color: ColorUtils.white.withOpacity(0.8)),),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios,color: ColorUtils.white.withOpacity(0.8),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 12,right: 12,bottom: 5,),
        decoration: BoxDecoration(
            // gradient:AppGradients.blackToBlueGrey,
        ),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF434343),
                      Color(0xFF000000),
                    ],
                    stops: [0.1, 1.0],
                  ),
                  border: Border.all(color: ColorUtils.white.withOpacity(0.2,),width: 1.3),
                  // color: ColorUtils.grey
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage(ImagesUtils.recording),
                              colorFilter: ColorFilter.mode(ColorUtils.red.withOpacity(0.7), BlendMode.srcIn),
                              fit: BoxFit.fill
                            )
                          ),

                        ),
                        HorizontalSpace(width: 10),
                        TextWidget(
                          title: 'Recording',
                          fontSize: 16,
                          textAlign: TextAlign.start,
                          textColor: ColorUtils.white,
                          fontWeight: FontWeight.w300,
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorUtils.white.withOpacity(0.2,),width: 1.3),
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Center(
                            child:  TextWidget(
                              title: 'CHECK-IN',
                              textAlign: TextAlign.center,
                              fontSize: 16,
                              textColor: ColorUtils.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )
                      ],
                    ),
                    VerticalSpace(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(image: AssetImage(ImagesUtils.time,),height:15,color:ColorUtils.appGreen),
                              HorizontalSpace(width: 4),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    title: 'Workout Day',
                                    fontSize: 12,
                                    textAlign: TextAlign.center,
                                    textColor: ColorUtils.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  VerticalSpace(height: 8),
                                  Row(
                                    children: [
                                      Text('3',style: TextStyle(fontSize: 20,color: ColorUtils.white.withOpacity(0.9)),),
                                      HorizontalSpace(width: 5),
                                      TextWidget(
                                        title: 'days',
                                        fontSize: 12,
                                        textAlign: TextAlign.center,
                                        textColor: ColorUtils.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              HorizontalSpace(width: 8),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 1.5,
                          color: ColorUtils.white.withOpacity(0.3),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(image: AssetImage(ImagesUtils.calories,),height:15,color: ColorUtils.appGreen),
                              HorizontalSpace(width:4),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    title: 'Calories(Kcal)',
                                    fontSize: 12,
                                    textAlign: TextAlign.center,
                                    textColor: ColorUtils.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  VerticalSpace(height: 8),
                                  Row(
                                    children: [
                                      Text('5.04',style: TextStyle(fontSize: 20,color: ColorUtils.white.withOpacity(0.9)),),
                                      HorizontalSpace(width: 5),
                                      TextWidget(
                                        title: 'Kcal',
                                        fontSize: 12,
                                        textAlign: TextAlign.center,
                                        textColor: ColorUtils.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ],
                ),
              ),
              VerticalSpace(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF434343),
                      Color(0xFF000000),
                    ],
                    stops: [0.1, 1.0],
                  ),
                  border: Border.all(color: ColorUtils.white.withOpacity(0.2,),width: 1.3),
                  // color: ColorUtils.grey
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage(ImagesUtils.achievement),
                                  colorFilter: ColorFilter.mode(ColorUtils.orange.withOpacity(0.7), BlendMode.srcIn),
                                  fit: BoxFit.fill
                              )
                          ),

                        ),
                        HorizontalSpace(width: 10),
                        TextWidget(
                          title: 'Achievement',
                          fontSize: 16,
                          textAlign: TextAlign.start,
                          textColor: ColorUtils.white,
                          fontWeight: FontWeight.w300,
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(left: 5,right: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorUtils.white.withOpacity(0.2,),width: 1.3),
                              borderRadius: BorderRadius.circular(6)
                          ),
                          child: Center(
                            child:  TextWidget(
                              title: 'CHECK-IN',
                              textAlign: TextAlign.center,
                              fontSize: 16,
                              textColor: ColorUtils.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )
                      ],
                    ),
                    VerticalSpace(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage('Assets/icons/silver-medal.png'),
                                        // colorFilter: ColorFilter.mode(ColorUtils.orange.withOpacity(0.7), BlendMode.srcIn),
                                        fit: BoxFit.fill
                                    )
                                ),
                              ),
                              HorizontalSpace(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    title: 'Cumulative',
                                    fontSize: 12,
                                    textAlign: TextAlign.center,
                                    textColor: ColorUtils.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  VerticalSpace(height: 8),
                                  Row(
                                    children: [
                                      Text('5',style: TextStyle(fontSize: 20,color: ColorUtils.white.withOpacity(0.9)),),
                                      HorizontalSpace(width: 5),
                                      TextWidget(
                                        title: 'Km',
                                        fontSize: 12,
                                        textAlign: TextAlign.center,
                                        textColor: ColorUtils.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 1.5,
                          color: ColorUtils.white.withOpacity(0.3),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HorizontalSpace(width: 10),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage('Assets/icons/medal.png'),
                                        // colorFilter: ColorFilter.mode(ColorUtils.orange.withOpacity(0.7), BlendMode.srcIn),
                                        fit: BoxFit.fill
                                    )
                                ),
                              ),
                              HorizontalSpace(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    title: 'Cumulative',
                                    fontSize: 12,
                                    textAlign: TextAlign.center,
                                    textColor: ColorUtils.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  VerticalSpace(height: 8),
                                  Row(
                                    children: [
                                      Text('5',style: TextStyle(fontSize: 20,color: ColorUtils.white.withOpacity(0.9)),),
                                      HorizontalSpace(width: 5),
                                      TextWidget(
                                        title: 'Km',
                                        fontSize: 12,
                                        textAlign: TextAlign.center,
                                        textColor: ColorUtils.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ],
                ),
              ),
              VerticalSpace(height: 15),
              TextWidget(
                title: 'My Device',
                fontSize: 15,
                textAlign: TextAlign.start,
                textColor: ColorUtils.white,
                fontWeight: FontWeight.w300,
              ),
              VerticalSpace(height: 5),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 18),
                    padding: EdgeInsets.only(top: 25,left:8,right: 10,bottom: 10),
                    decoration: BoxDecoration(
                      gradient: AppGradients.greyTopTOBlackBottom,
                        border: Border.all(color: ColorUtils.white.withOpacity(0.2,),width: 1.3),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                  gradient: AppGradients.circleGradient
                              ),
                              child: Image(image: AssetImage('Assets/my_Icons/headphone.png'),height: 15,),
                            ),
                            HorizontalSpace(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  title: 'Heart Rate Device',
                                  fontSize: 14,
                                  textAlign: TextAlign.start,
                                  textColor: ColorUtils.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w300,
                                ),
                                Text('CL808-0619732',style: TextStyle(color: ColorUtils.white.withOpacity(0.7)),)
                              ],
                            ),
                            Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  title: 'Device not found',
                                  fontSize: 14,
                                  textAlign: TextAlign.start,
                                  textColor: ColorUtils.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w300,
                                ),
                                Icon(Icons.chevron_right,color: ColorUtils.white,)
                              ],
                            )
                          ],
                        ),
                        VerticalSpace(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: AppGradients.circleGradient
                              ),
                              child: Image(image: AssetImage('Assets/my_Icons/headphone.png'),height: 15,),
                            ),
                            HorizontalSpace(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  title: 'Heart Rate Device',
                                  fontSize: 14,
                                  textAlign: TextAlign.start,
                                  textColor: ColorUtils.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w300,
                                ),
                                Text('CL808-0619732',style: TextStyle(color: ColorUtils.white.withOpacity(0.7)),)
                              ],
                            ),
                            Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  title: 'Device not found',
                                  fontSize: 14,
                                  textAlign: TextAlign.start,
                                  textColor: ColorUtils.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w300,
                                ),
                                Icon(Icons.chevron_right,color: ColorUtils.white,)
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: SelectDeviceTypeScreen(),
                        withNavBar: false,
                      );
                    },
                    child: Container(
                      width: screenWidth(context)*0.4,
                      padding: EdgeInsets.only(left: 6,right: 12,top: 6,bottom: 6),
                      decoration: BoxDecoration(
                          color: ColorUtils.black,
                          border: Border.all(color: ColorUtils.white.withOpacity(0.2,),width: 1.3),
                          borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.add_circle_outline_outlined,
                            color: ColorUtils.white,
                          ),
                          TextWidget(
                            title: 'Add Device',
                            fontSize: 14,
                            textAlign: TextAlign.start,
                            textColor: ColorUtils.white,
                            fontWeight: FontWeight.w300,
                          ),
                          Container(width: 10,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              VerticalSpace(height: 15),
              Container(
                padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: AppGradients.greyTopTOBlackBottom,
                    border: Border.all(color: ColorUtils.white.withOpacity(0.2,),width: 1.3)
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          gradient: AppGradients.circleGradient
                      ),
                      child: Image(image: AssetImage(ImagesUtils.help),height: 15,),
                    ),
                    HorizontalSpace(width: 10),
                    TextWidget(
                      title: 'Help',
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.white.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,color: ColorUtils.white.withOpacity(0.8),),
                  ],
                ),
              ),
              VerticalSpace(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: AppGradients.greyTopTOBlackBottom,
                    border: Border.all(color: ColorUtils.white.withOpacity(0.2,),width: 1.3)
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          gradient: AppGradients.circleGradient
                      ),
                      child: Image(image: AssetImage(ImagesUtils.feedback),height: 10,),
                    ),
                    HorizontalSpace(width: 10),
                    TextWidget(
                      title: 'Feedback',
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.white.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,color: ColorUtils.white.withOpacity(0.8),),
                  ],
                ),
              ),
              VerticalSpace(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: AppGradients.greyTopTOBlackBottom,

                    border: Border.all(color: ColorUtils.white.withOpacity(0.2,),width: 1.3)
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          gradient: AppGradients.circleGradient
                      ),
                      child: Image(image: AssetImage(ImagesUtils.version),height: 10,),
                    ),
                    HorizontalSpace(width: 10),
                    TextWidget(
                      title: 'Version',
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.white.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                    TextWidget(
                      title: '4.2.6',
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.white.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              VerticalSpace(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: AppGradients.greyTopTOBlackBottom,
                    border: Border.all(color: ColorUtils.white.withOpacity(0.2,),width: 1.3)
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          gradient: AppGradients.circleGradient
                      ),
                      child: Image(image: AssetImage(ImagesUtils.aboutus),height: 15,),
                    ),
                    HorizontalSpace(width: 10),
                    TextWidget(
                      title: 'About Us',
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.white.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,color: ColorUtils.white.withOpacity(0.8),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}