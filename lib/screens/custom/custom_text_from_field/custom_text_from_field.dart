import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/common_image_widget/common_image_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/constant/colors.dart';
import '../../../generated/assets.dart';

class FreelanceMarketTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;
  final Widget? suffix,prefix;
  final Color borderColor; // 👈 New parameter

  const FreelanceMarketTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.suffix,
    this.prefix,
    this.borderColor = kTextSecondaryColor, // 👈 Default value
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: GoogleFonts.inter(color: kTextPrimaryColor, fontSize: 14.sp),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          color: kTextSecondaryColor,
          fontSize: 14.sp,
        ),
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: kTextSecondaryColor)
            : null,
        suffix: suffix,
        prefix: prefix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: kPrimaryColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: kRedColor),
        ),
        errorStyle: GoogleFonts.inter(
          color: kRedColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: kRedColor, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      ),
    );
  }
}







class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: CommonImageView(svgPath: Assets.svgSearch,),
          hintText: "Search here...",
          hintStyle: TextStyle(
            color: kTextSecondary2Color,
            fontSize: 16,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
