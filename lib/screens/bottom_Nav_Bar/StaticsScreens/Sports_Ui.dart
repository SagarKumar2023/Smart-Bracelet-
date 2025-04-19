//   import 'package:flutter/material.dart';
// import 'package:x_fitness/constant/color_Utils.dart';
// import 'package:x_fitness/constant/images.dart';
// import 'package:x_fitness/constant/spacer.dart';
// import 'package:x_fitness/widgets/my_Text.dart';
// class SportsUi extends StatelessWidget {
//   const SportsUi({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       padding: EdgeInsets.all(15),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: ColorUtils.grey
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           TextWidget(
//             title: 'Sports',
//             fontSize: 16,
//             textAlign: TextAlign.start,
//             textColor: ColorUtils.white,
//             fontWeight: FontWeight.w600,
//           ),
//           VerticalSpace(height: 15),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Container(
//                 padding: EdgeInsets.only(left: 15,right: 15,top: 6,bottom: 6),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   border: Border.all(color: ColorUtils.appGreen,width: 1.3)
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     TextWidget(
//                       title: 'Year',
//                       fontSize: 12,
//                       textAlign: TextAlign.center,
//                       textColor: ColorUtils.white,
//                       fontWeight: FontWeight.w300,
//                     ),
//                     HorizontalSpace(width: 8),
//                     Icon(Icons.keyboard_arrow_down_rounded,color: ColorUtils.white,size: 15,)
//                   ],
//                 ),
//               ),
//               /// is same design ka dropdown create karna hai year by default selected rahega
//               /// use 2 me se 1 select kar sakta hai year month
//               HorizontalSpace(width: 10),
//               Container(
//                 padding: EdgeInsets.only(left: 15,right: 15,top: 6,bottom: 6),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     border: Border.all(color: ColorUtils.appGreen,width: 1.3)
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     TextWidget(
//                       title: 'Month',
//                       fontSize: 12,
//                       textAlign: TextAlign.center,
//                       textColor: ColorUtils.white,
//                       fontWeight: FontWeight.w300,
//                     ),
//                     HorizontalSpace(width: 8),
//                     Icon(Icons.keyboard_arrow_down_rounded,color: ColorUtils.white,size: 15,)
//                   ],
//                 ),
//               ),
//               /// is same design ka dropdown create karna hai 2025 by default selected rahega
//               /// use 2 me se 1 select kar sakta hai 2024 ,2025
//               HorizontalSpace(width: 10),
//               Container(
//                 padding: EdgeInsets.only(left: 15,right: 15,top: 6,bottom: 6),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     border: Border.all(color: ColorUtils.appGreen,width: 1.3)
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     TextWidget(
//                       title: 'Day',
//                       fontSize: 12,
//                       textAlign: TextAlign.center,
//                       textColor: ColorUtils.white,
//                       fontWeight: FontWeight.w300,
//                     ),
//                     HorizontalSpace(width: 8),
//                     Icon(Icons.keyboard_arrow_down_rounded,color: ColorUtils.white,size: 15,)
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           /// is same design ka dropdown create karna hai Whole by default selected rahega
//           /// use 2 me se 1 select kar sakta hai Whole,Running,Cycling,Skipping
//           VerticalSpace(height: 15),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     TextWidget(
//                       title: 'Total\n ',
//                       fontSize: 12,
//                       textAlign: TextAlign.center,
//                       textColor: ColorUtils.white,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     VerticalSpace(height: 8),
//                     Text('0',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
//                   ],
//                 ),
//               ),
//               HorizontalSpace(width: 8),
//               Container(
//                 height: 70,
//                 width: 2,
//                 color: ColorUtils.white.withOpacity(0.3),
//               ),
//               HorizontalSpace(width: 8),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     TextWidget(
//                       title: 'Total Duration\n(Min)',
//                       fontSize: 12,
//                       textAlign: TextAlign.center,
//                       textColor: ColorUtils.white,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     VerticalSpace(height: 8),
//                     Text('0',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
//                   ],
//                 ),
//               ),
//               HorizontalSpace(width: 8),
//               Container(
//                 height: 70,
//                 width: 2,
//                 color: ColorUtils.white.withOpacity(0.3),
//               ),
//               HorizontalSpace(width: 8),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     TextWidget(
//                       title: 'Consume\n(Kcal)',
//                       fontSize: 12,
//                       textAlign: TextAlign.center,
//                       textColor: ColorUtils.white,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     VerticalSpace(height: 8),
//                     Text('0.0',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/widgets/my_Text.dart';

import '../MeScreens/Add_Device_Screen/select_device_type_design.dart';

class SportsUi extends StatefulWidget {
  const SportsUi({super.key});

  @override
  State<SportsUi> createState() => _SportsUiState();
}

class _SportsUiState extends State<SportsUi> {
  String _viewBy = 'Year';
  String _year = '2025';
  String _activity = 'Whole';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              gradient: AppGradients.greyTopTOBlackBottom,
              border: Border.all(color: ColorUtils.white.withOpacity(0.3),width: 1.1)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                title: 'Sports',
                fontSize: 16,
                textAlign: TextAlign.start,
                textColor: ColorUtils.white,
                fontWeight: FontWeight.w600,
              ),
              VerticalSpace(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _customDropdown<String>(
                    value: _viewBy,
                    items: ['Year', 'Month'],
                    onChanged: (val) => setState(() => _viewBy = val!),
                  ),
                  HorizontalSpace(width: 10),
                  _customDropdown<String>(
                    value: _year,
                    items: ['2024', '2025'],
                    onChanged: (val) => setState(() => _year = val!),
                  ),
                  HorizontalSpace(width: 10),
                  _customDropdown<String>(
                    value: _activity,
                    items: ['Whole', 'Running', 'Cycling', 'Skipping'],
                    onChanged: (val) => setState(() => _activity = val!),
                  ),
                ],
              ),
              VerticalSpace(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoTile('Total\n', '0'),
                  _divider(),
                  _infoTile('Total Duration\n(Min)', '0'),
                  _divider(),
                  _infoTile('Consume\n(Kcal)', '0.0'),
                ],
              ),
            ],
          ),
        ),
        VerticalSpace(height: 15),
        SelectDeviceTypeDesign(onTap: () {  }, deviceTitle: 'Ranking List', deviceIcon:ImagesUtils.ranking,iconColor: ColorUtils.white,)
      ],
    );
  }

  Widget _customDropdown<T>({
    required T value,
    required List<T> items,
    required void Function(T?) onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: ColorUtils.appGreen, width: 1.3),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          borderRadius: BorderRadius.circular(10),
          value: value,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: ColorUtils.white, size: 15),
          dropdownColor: ColorUtils.grey,
          style: TextStyle(color: ColorUtils.white, fontSize: 12),
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              alignment: Alignment.center,
              child: TextWidget(
                title: item.toString(),
                fontSize: 12,
                textColor: ColorUtils.white,
                fontWeight: FontWeight.w300,
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return Expanded(
      child: Column(
        children: [
          TextWidget(
            title: title,
            fontSize: 12,
            textAlign: TextAlign.center,
            textColor: ColorUtils.white,
            fontWeight: FontWeight.w400,
          ),
          VerticalSpace(height: 8),
          Text(
            value,
            style: TextStyle(fontSize: 25, color: ColorUtils.white.withOpacity(0.9)),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Row(
      children: [
        HorizontalSpace(width: 8),
        Container(
          height: 70,
          width: 2,
          color: ColorUtils.white.withOpacity(0.3),
        ),
        HorizontalSpace(width: 8),
      ],
    );
  }
}
