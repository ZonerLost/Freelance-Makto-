import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/common_image_widget/common_image_widget.dart';
import 'package:freelance_market/screens/custom/custom_app_bar/custom_app_bar.dart';
import 'package:freelance_market/screens/custom/custom_button/custom_button.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';
import 'package:freelance_market/screens/custom/custom_text_from_field/custom_text_from_field.dart';

import '../../../../config/constant/colors.dart';
import '../../../../generated/assets.dart';


class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      appBar: CustomAppBar2(
        title: "Account Settings",
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: FreelanceMarketButton(label: "Save changes", onPressed: (){}),
        ),
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
            "Profile Picture",
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          12.verticalSpace,
          Container(
            padding: const EdgeInsets.all(12),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              shadows: [
                BoxShadow(
                  color: Color(0x07000000),
                  blurRadius: 14,
                  offset: Offset(2, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              children: [
                CommonImageView(imagePath: Assets.imagesProfile,radius: 50,height: 50,),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FreelanceMarketText(
                        "profile.jpeg",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      8.verticalSpace,
                      FreelanceMarketText(
                        "Uploaded on 03/23/2024",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kTextSecondary2Color,
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<int>(
                  onSelected: (value) {
                    if (value == 1) {
                      // Action 1
                    } else if (value == 2) {
                      // Action 2
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: FreelanceMarketText(
                          "Add photo",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: FreelanceMarketText(
                        "Delete",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kRed2Color,

                      ),
                    ),
                  ],
                  child: CommonImageView(
                    imagePath: Assets.imagesMore,
                    height: 25,
                  ),
                )

              ],
            ),
          ),
          24.verticalSpace,
          FreelanceMarketText(
            "Personal Details",
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          12.verticalSpace,
          FreelanceMarketTextField(
              controller: TextEditingController(),
              hintText: "Kevin Thomas",
              borderColor: kBackgroundColor,
          ),
          8.verticalSpace,
          FreelanceMarketTextField(
              controller: TextEditingController(),
              hintText: "Your email here...",
              borderColor: kBackgroundColor,
          ),

        ],
      ),
    );
  }
}
