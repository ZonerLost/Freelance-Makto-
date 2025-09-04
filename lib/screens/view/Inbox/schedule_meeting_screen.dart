import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/common_image_widget/common_image_widget.dart';
import 'package:freelance_market/screens/custom/custom_app_bar/custom_app_bar.dart';
import 'package:freelance_market/screens/custom/custom_button/custom_button.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';
import 'package:freelance_market/screens/custom/custom_text_from_field/custom_text_from_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/constant/colors.dart';
import '../../../generated/assets.dart';



class ScheduleMeetingScreen extends StatelessWidget {
  const ScheduleMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Schedule Meeting",
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: FreelanceMarketButton(label: "Schedule", onPressed: showCustomDialog),
        ),
      ),
      body: _body(),
    );
  }
  _body(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          FreelanceMarketTextField(
              controller: TextEditingController(),
              hintText: "Date",
              suffix: CommonImageView(svgPath: Assets.svgCalendar,),
          ),
          8.verticalSpace,
          FreelanceMarketTextField(
              controller: TextEditingController(),
              hintText: "Time",
              suffix: CommonImageView(svgPath: Assets.svgClock,),
          ),
          8.verticalSpace,
          FreelanceMarketTextField(
              controller: TextEditingController(),
              hintText: "Interview Type",
            suffixIcon: Icons.arrow_drop_down,
          ),
          8.verticalSpace,
          FreelanceMarketTextField(
            controller: TextEditingController(),
            hintText: "Meeting Link",
          ),

        ],
      ),
    );
  }
  void showCustomDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: kWhiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonImageView(
                imagePath: Assets.imagesSuccessPopup,
                height: 130,
              ),
              8.verticalSpace,
              FreelanceMarketText(
                "Congratulations!",
                  fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              8.verticalSpace,
              FreelanceMarketText(
                "Meeting has been scheduled\nsuccessfully.",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              24.verticalSpace,
              FreelanceMarketButton(label: "Continue", onPressed: (){}),
            ],
          ),
        ),
      ),
      barrierDismissible: true, // Prevent closing by tapping outside
    );
  }
}





