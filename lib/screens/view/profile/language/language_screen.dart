import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/custom_app_bar/custom_app_bar.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';
import 'package:get/get.dart';

import '../../../../config/constant/colors.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});
  final selectedValue = 1.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "Languages"),
      body: _body(),
    );
  }

  _body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(
          color: kWhiteColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: [
            BoxShadow(
              color: Color(0x07000000),
              blurRadius: 14,
              offset: Offset(2, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FreelanceMarketText(
              "English",
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),

            Radio<int>(
              value: 1,
              groupValue: selectedValue.value,
              onChanged: (int? value) {
                selectedValue.value = value!;
              },
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
      ),
    );
  }
}
