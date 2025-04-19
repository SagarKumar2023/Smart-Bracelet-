import 'package:flutter/material.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/widgets/my_Text.dart';
class BodyFatUi extends StatefulWidget {
  const BodyFatUi({super.key});

  @override
  State<BodyFatUi> createState() => _BodyFatUiState();
}

class _BodyFatUiState extends State<BodyFatUi> {
  String _viewBy = 'Year';
  String _year = '2025';

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
  @override
  Widget build(BuildContext context) {
    return  Container(
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
            title: 'Body Fat',
            fontSize: 16,
            textAlign: TextAlign.start,
            textColor: ColorUtils.white,
            fontWeight: FontWeight.w600,
          ),
          VerticalSpace(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ],
          ),
          VerticalSpace(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      title: 'Latest Weight\n(Kg)',
                      fontSize: 12,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.white,
                      fontWeight: FontWeight.w400,
                    ),
                    VerticalSpace(height: 8),
                    Text('0.0',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
                  ],
                ),
              ),
              HorizontalSpace(width: 8),
              Container(
                height: 70,
                width: 2,
                color: ColorUtils.white.withOpacity(0.3),
              ),
              HorizontalSpace(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      title: 'Body Weight\nChange(Kg)',
                      fontSize: 12,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.white,
                      fontWeight: FontWeight.w400,
                    ),
                    VerticalSpace(height: 8),
                    Text('0.0',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
                  ],
                ),
              ),
              HorizontalSpace(width: 8),
              Container(
                height: 70,
                width: 2,
                color: ColorUtils.white.withOpacity(0.3),
              ),
              HorizontalSpace(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      title: 'Acg body\nWeight(Kg)',
                      fontSize: 12,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.white,
                      fontWeight: FontWeight.w400,
                    ),
                    VerticalSpace(height: 8),
                    Text('0.0',style: TextStyle(fontSize: 25,color: ColorUtils.white.withOpacity(0.9)),),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
