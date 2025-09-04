import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/custom_app_bar/custom_app_bar.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';
import 'package:freelance_market/screens/custom/custom_text_from_field/custom_text_from_field.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../config/constant/colors.dart';



class SettingScreen extends StatelessWidget {
   SettingScreen({super.key});

  final isOn = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      appBar: CustomAppBar2(
        title: "Settings",
      ),
      body: _body(),
    );
  }
  _body(){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FreelanceMarketText(
              "Change password",
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            12.verticalSpace,
            FreelanceMarketTextField(
                controller: TextEditingController(),
                hintText: "Old Password...",
              borderColor: kBackgroundColor,
              suffixIcon: Icons.remove_red_eye_outlined,
            ),
            8.verticalSpace,
            FreelanceMarketTextField(
                controller: TextEditingController(),
                hintText: "Create Password...",
              borderColor: kBackgroundColor,
              suffixIcon: Icons.remove_red_eye_outlined,
            ),
            8.verticalSpace,
            FreelanceMarketTextField(
                controller: TextEditingController(),
                hintText: "Retype Password...",
              borderColor: kBackgroundColor,
              suffixIcon: Icons.remove_red_eye_outlined,
            ),
            12.verticalSpace,
            FreelanceMarketText(
              "Notification Settings",
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            12.verticalSpace,
            Container(
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
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FreelanceMarketText(
                        "New for you",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      Obx(
                            () => Transform.scale(
                          scale: 0.8, // adjust size (0.8 = 80% of original size)
                          child: Switch(
                            value: isOn.value,
                            onChanged: (value) => isOn.value = value,
                            activeColor: Colors.white,
                            activeTrackColor: kPrimaryColor,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(color: kBackgroundColor,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FreelanceMarketText(
                        "New Jobs",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      Obx(
                            () => Transform.scale(
                          scale: 0.8, // adjust size (0.8 = 80% of original size)
                          child: Switch(
                            value: isOn.value,
                            onChanged: (value) => isOn.value = value,
                            activeColor: Colors.white,
                            activeTrackColor: kPrimaryColor,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(color: kBackgroundColor,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FreelanceMarketText(
                        "Messages",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      Obx(
                            () => Transform.scale(
                          scale: 0.8, // adjust size (0.8 = 80% of original size)
                          child: Switch(
                            value: isOn.value,
                            onChanged: (value) => isOn.value = value,
                            activeColor: Colors.white,
                            activeTrackColor: kPrimaryColor,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(color: kBackgroundColor,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FreelanceMarketText(
                        "Job matches",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      Obx(
                            () => Transform.scale(
                          scale: 0.8, // adjust size (0.8 = 80% of original size)
                          child: Switch(
                            value: isOn.value,
                            onChanged: (value) => isOn.value = value,
                            activeColor: Colors.white,
                            activeTrackColor: kPrimaryColor,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
