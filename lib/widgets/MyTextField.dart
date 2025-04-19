import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_fitness/constant/color_Utils.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? titleText;
  final String? hintText;
  final Widget? preFixIcon;
  final Widget? suffixIcon;
  final double borderRadius;
  final int? maxLength ;
  final Color? fillColor;
  final Function(String)? onChanged;
  final String? Function(String?)? validation;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final bool obscureText;
  final int? maxLines;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatter;

  const MyTextField({
    super.key,
    required this.controller,
    this.titleText,
    this.hintText,
    this.keyboardType,
    this.readOnly,
    this.maxLines,
    this.onTap,
    this.onFieldSubmitted,
    this.inputFormatter,
    required this.borderRadius,
    this.preFixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validation,
    this.onChanged, this.maxLength, this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      onChanged: onChanged,

      cursorWidth: 1.5,
      validator: validation,
      obscureText: obscureText,
      controller: controller,
      onTap: onTap,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: ColorUtils.white,
        ),
      ),
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        prefixIcon: preFixIcon,
        suffixIcon: suffixIcon,
        // fillColor: Colors.black.withOpacity(0),
        fillColor: fillColor??Colors.transparent,
        filled: true,
        hintStyle: const TextStyle(fontSize: 14, color: Colors.white),
        disabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: ColorUtils.white,width: 1.2),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: ColorUtils.white.withOpacity(0.5),width: 1.2),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide:  BorderSide(color: ColorUtils.appGreen.withOpacity(0.7),width: 1.2),
        ),
      ),
    );
  }
}
