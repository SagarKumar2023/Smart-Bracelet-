import 'package:flutter/material.dart';
import 'package:x_fitness/constant/color_Utils.dart';

class MyBackButton extends StatelessWidget {
  final VoidCallback onTap;
  const MyBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTap();},
      child: Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorUtils.black.withOpacity(0.3), width: 0.7),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
