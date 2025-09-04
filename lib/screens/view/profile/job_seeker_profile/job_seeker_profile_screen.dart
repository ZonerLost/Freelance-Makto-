import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/config/routes/routes_names.dart';
import 'package:freelance_market/screens/custom/common_image_widget/common_image_widget.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../config/constant/colors.dart';
import '../../../../generated/assets.dart';
import '../../../custom/custom_button/custom_button.dart';




class JobSeekerProfileScreen extends StatelessWidget {
  const JobSeekerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: _body(),
    );
  }
  _body(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(30),
              decoration: ShapeDecoration(
                color: kWhiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x07000000),
                    blurRadius: 14,
                    offset: Offset(2, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                children: [
                  CommonImageView(
                    imagePath: Assets.imagesProfile,
                    height: 65,
                    radius: 50,
                  ),
                  16.verticalSpace,
                  FreelanceMarketText(
                    "Kevin Thomas",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  5.verticalSpace,
                  FreelanceMarketText(
                    "kevin.thomas2@gmail.com",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kTextSecondary2Color,
                  )
                ],
              ),
            ),
            16.verticalSpace,
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: kWhiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x07000000),
                    blurRadius: 14,
                    offset: Offset(2, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                children: [
                  settingsRow(
                    text: "Account Settings",
                    imagePath: Assets.imagesP1,
                    onTap: () {
                     Get.toNamed(RouteName.accountSettingScreen);
                    },
                  ),
                  settingsRow(
                    text: "Edit Profile",
                    imagePath: Assets.imagesP1,
                    onTap: () {
                     // Get.to(RouteName.Ed);
                    },
                  ),
                  settingsRow(
                    text: "Favorites",
                    imagePath: Assets.imagesFavourite ,
                    onTap: () {
                      Get.toNamed(RouteName.favouriteScreen);
                    },
                  ),
                  settingsRow(
                    text: "Language",
                    imagePath: Assets.imagesLanguage,
                    onTap: () {
                      Get.toNamed(RouteName.languageScreen);
                    },
                  ),
                  settingsRow(
                    text: "Settings",
                    imagePath: Assets.imagesSetting,
                    onTap: () {
                      Get.toNamed(RouteName.accountSettingScreen);
                    },
                  ),
                  settingsRow(
                    text: "FAQs",
                    imagePath: Assets.imagesFaqs,
                    onTap: () {
                      Get.toNamed(RouteName.faqsScreen);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Divider(
                      color: kBackgroundColor,
                    ),
                  ),
                  settingsRow(
                    text: "Terms and Conditions",
                    imagePath: Assets.imagesTremAndCondition,
                    onTap: () {
                      Get.toNamed(RouteName.termAndConditionScreen);
                    },
                  ),
                  settingsRow(
                    text: "Privacy Policy",
                    imagePath: Assets.imagesPrivacyPolicy,
                    onTap: () {
                      Get.toNamed(RouteName.privacyPolicyScreen);
                    },
                  ),
                  GestureDetector(
                    onTap: (){
                      showCustomDialog();
                    },
                    child: Row(
                      children: [
                        CommonImageView(
                          imagePath: Assets.imagesLogout,
                          height: 35,
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: FreelanceMarketText(
                            "Logout",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget settingsRow({
    required String text,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        //borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            CommonImageView(
              imagePath: imagePath,
              height: 35,
            ),
            12.horizontalSpace,
            Expanded(
              child: FreelanceMarketText(
                text,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            CommonImageView(
              svgPath: Assets.svgArrowRight,
            ),
          ],
        ),
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
                imagePath: Assets.imagesLogoutpopup,
                height: 130,
              ),
              15.verticalSpace,
              FreelanceMarketText(
                "Logging out?",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              8.verticalSpace,
              FreelanceMarketText(
                "Are your sure you want to log out?",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              24.verticalSpace,
              FreelanceMarketButton(label: "Yes, logout", onPressed: (){}),
              20.verticalSpace,
              FreelanceMarketText(
                "Not now",
                fontSize: 14,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                color: kTextSecondary2Color,
              ),
              24.verticalSpace,

            ],
          ),
        ),
      ),
      barrierDismissible: true, // Prevent closing by tapping outside
    );
  }
}
