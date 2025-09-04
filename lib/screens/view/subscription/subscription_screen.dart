import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/generated/assets.dart';
import 'package:freelance_market/screens/custom/common_image_widget/common_image_widget.dart';
import 'package:freelance_market/screens/custom/custom_app_bar/custom_app_bar.dart';
import 'package:freelance_market/screens/custom/custom_button/custom_button.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';
import 'package:get/get.dart';

import '../../../config/constant/colors.dart';



class SubscriptionScreen extends StatelessWidget {
   SubscriptionScreen({super.key});

  final selectedIndex = 0.obs; // 0 = Monthly, 1 = Yearly

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          8.horizontalSpace,
          CommonImageView(imagePath: Assets.imagesFeatured,height: 40,),
          10.horizontalSpace,
          FreelanceMarketText(
            "Subscriptions",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          Spacer(),
        ],
      ),
      body: _body(),
    );
  }
  _body(){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FreelanceMarketText(
              "Select your Subscription plan",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kTextSecondary2Color,
            ),
            15.verticalSpace,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(6),
              height: 40.h,
              decoration: ShapeDecoration(
                color: const Color(0xFFE9E9EA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Obx(() => Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => selectedIndex.value = 0,
                      child: Container(
                        height: 33.h,
                        decoration: ShapeDecoration(
                          color: selectedIndex.value == 0
                              ? kPrimaryColor
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Monthly",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: selectedIndex.value == 0
                                  ? kWhiteColor
                                  : kTextSecondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                   SizedBox(width: 6.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => selectedIndex.value = 1,
                      child: Container(
                        height: 33.h,
                        decoration: ShapeDecoration(
                          color: selectedIndex.value == 1
                              ? kPrimaryColor
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Yearly",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: selectedIndex.value == 1
                                  ? kWhiteColor
                                  : kTextSecondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),

            40.verticalSpace,
            Obx(() {
              return selectedIndex.value == 0
                  ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 12,
                itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: ShapeDecoration(
                          color: const Color(0x0F226399),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      FreelanceMarketText(
                                        "Small",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      8.verticalSpace,
                                      FreelanceMarketText(
                                        "AED 149",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      11.verticalSpace,
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                        decoration: ShapeDecoration(
                                          color: const Color(0x147B61FF),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(19),
                                          ),
                                        ),
                                        child: FreelanceMarketText(
                                          "1 Month",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      FreelanceMarketText(
                                        "You Get",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      13.verticalSpace,
                                      Row(
                                        children: [
                                          CommonImageView(
                                            svgPath: Assets.svgCheckCircle,
                                          ),
                                          8.horizontalSpace,
                                          Expanded(
                                            child: FreelanceMarketText(
                                              "Feature 1",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          CommonImageView(
                                            svgPath: Assets.svgPh,
                                          ),
                                        ],
                                      ),
                                      8.verticalSpace,
                                      Row(
                                        children: [
                                          CommonImageView(
                                            svgPath: Assets.svgCheckCircle,
                                          ),
                                          8.horizontalSpace,
                                          Expanded(
                                            child: FreelanceMarketText(
                                              "Feature 1",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          CommonImageView(
                                            svgPath: Assets.svgPh,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            11.verticalSpace,
                            FreelanceMarketText(
                              "(Non-refundable)",
                              fontSize: 8,
                              fontWeight: FontWeight.w500,
                            ),
                            5.verticalSpace,
                            FreelanceMarketButton(label: "Subscribe", onPressed: (){},borderRadius: 10,),
                          ],
                        ),
                      ),
                    );
                  },)
                  : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: ShapeDecoration(
                        color: const Color(0x0F226399),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FreelanceMarketText(
                                      "Small",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    8.verticalSpace,
                                    FreelanceMarketText(
                                      "AED 149",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    11.verticalSpace,
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      decoration: ShapeDecoration(
                                        color: const Color(0x147B61FF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(19),
                                        ),
                                      ),
                                      child: FreelanceMarketText(
                                        "1 Month",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )

                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    FreelanceMarketText(
                                      "You Get",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    13.verticalSpace,
                                    Row(
                                      children: [
                                        CommonImageView(
                                          svgPath: Assets.svgCheckCircle,
                                        ),
                                        8.horizontalSpace,
                                        Expanded(
                                          child: FreelanceMarketText(
                                            "Feature 1",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        CommonImageView(
                                          svgPath: Assets.svgPh,
                                        ),
                                      ],
                                    ),
                                    8.verticalSpace,
                                    Row(
                                      children: [
                                        CommonImageView(
                                          svgPath: Assets.svgCheckCircle,
                                        ),
                                        8.horizontalSpace,
                                        Expanded(
                                          child: FreelanceMarketText(
                                            "Feature 1",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        CommonImageView(
                                          svgPath: Assets.svgPh,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          11.verticalSpace,
                          FreelanceMarketText(
                            "(Non-refundable)",
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                          5.verticalSpace,
                          FreelanceMarketButton(label: "Subscribe", onPressed: (){},borderRadius: 10,),
                        ],
                      ),
                    ),
                  );
                },);
            }),

          ],

        ),
      ),
    );
  }
}



