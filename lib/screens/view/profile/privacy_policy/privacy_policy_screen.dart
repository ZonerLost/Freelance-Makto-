import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/custom_app_bar/custom_app_bar.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';

import '../../../../config/constant/colors.dart';



class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Privacy Policy",
      ),
      body: _body(),
    );
  }
  _body(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FreelanceMarketText(
            "Introduction",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          8.verticalSpace,
          FreelanceMarketText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non est"
                " vel neque suscipit tristique. Integer ullamcorper leo ut metus ultricies, eu suscipit tellus tempor.",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: kTextSecondary2Color,
            textAlign: TextAlign.justify,
            lineHeight: 1.71,
          ),
          18.verticalSpace,
          FreelanceMarketText(
            "Acceptance of Terms",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          8.verticalSpace,
          FreelanceMarketText(
            "Vestibulum tincidunt purus in ultrices ultricies. Aliquam eu arcu id ligula interdum facilisis. "
                "Sed sed vestibulum felis. Phasellus eleifend feugiat felis, ut feugiat odio fringilla vel. Suspendisse potenti."
                " Morbi ullamcorper, "
                "velit sit amet viverra malesuada, tortor sapien mattis nulla, in cursus sem turpis in dolor.",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: kTextSecondary2Color,
            textAlign: TextAlign.justify,
            lineHeight: 1.71,
          ),
          18.verticalSpace,
          FreelanceMarketText(
            "User Responsibilities",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          8.verticalSpace,
          bulletPointText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
          ),
          8.verticalSpace,
          bulletPointText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
          ),
          8.verticalSpace,
          bulletPointText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
          ),


        ],
      ),
    );
  }

  Widget bulletPointText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Container(
            height: 4,
            width: 4,
            decoration: const BoxDecoration(
              color: kTextSecondary2Color,
              shape: BoxShape.circle,
            ),
          ),
        ),
        8.horizontalSpace,
        Expanded(
          child: FreelanceMarketText(
            text,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: kTextSecondary2Color,
             lineHeight: 1.71, // uncomment if you want custom line height
          ),
        ),
      ],
    );
  }

}
