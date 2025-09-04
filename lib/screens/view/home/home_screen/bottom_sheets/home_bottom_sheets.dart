import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/common_image_widget/common_image_widget.dart';
import 'package:freelance_market/screens/custom/custom_button/custom_button.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';
import 'package:freelance_market/screens/custom/custom_text_from_field/custom_text_from_field.dart';
import 'package:get/get.dart';

import '../../../../../config/constant/colors.dart';
import '../../../../../generated/assets.dart';

class HomeBottomSheet {
  static void reportServiceBottomSheet() {
    Get.bottomSheet(
      SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FreelanceMarketText(
                "Report a service",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              5.verticalSpace,
              FreelanceMarketText(
                  'Help us maintain a safe and trustworthy platform\nby reporting inappropriate service postings.',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                color: kTextSecondary2Color,
              ),
              24.verticalSpace,
              FreelanceMarketTextField(
                controller: TextEditingController(),
                hintText: 'Reason for reporting*',
                suffixIcon: Icons.arrow_drop_down,
              ),
              8.verticalSpace,
              FreelanceMarketTextField(
                  controller: TextEditingController(), hintText: "Additional comments (optional)",maxLines: 5,),
              45.verticalSpace,
              FreelanceMarketButton(label: "Submit", onPressed: (){},),
            ],
          ),
        ),
      ),
      isScrollControlled: true, // allows full height control
    );
  }



  static void rateClientBottomSheet() {
    Get.bottomSheet(
      SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FreelanceMarketText(
                "Rate your client",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              5.verticalSpace,
              FreelanceMarketText(
                'Share your experience and provide valuable\nfeedback to help others. ',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                color: kTextSecondary2Color,
              ),
              24.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: RatingBar(
                  alignment: Alignment.center,
                  size: 40,
                  filledIcon: Icons.star_rate_rounded,
                  emptyIcon: Icons.star_border_rounded,
                  onRatingChanged: (value) => debugPrint('$value'),
                  initialRating: 3,
                  maxRating: 5,
                ),
              ),
              24.verticalSpace,
              FreelanceMarketTextField(
                controller: TextEditingController(), hintText: "Write your review",maxLines: 5,),
              45.verticalSpace,
              FreelanceMarketButton(label: "Submit", onPressed: (){},),
            ],
          ),
        ),
      ),
      isScrollControlled: true, // allows full height control
    );
  }


  static void successBottomSheet() {
    Get.bottomSheet(
      SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonImageView(
                svgPath: Assets.svgSuccess,
              ),
              16.verticalSpace,
              FreelanceMarketText(
                "Success!",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              5.verticalSpace,
              FreelanceMarketText(
                'Your review has been submitted\nsuccessfully.',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                color: kTextSecondary2Color,
              ),
              24.verticalSpace,
              FreelanceMarketButton(label: "Back to Home", onPressed: (){},),
            ],
          ),
        ),
      ),
      isScrollControlled: true, // allows full height control
    );
  }
}
