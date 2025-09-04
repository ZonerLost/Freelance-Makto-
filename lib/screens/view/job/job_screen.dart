import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/common_image_widget/common_image_widget.dart';
import 'package:freelance_market/screens/custom/custom_app_bar/custom_app_bar.dart';

import '../../../config/constant/colors.dart';
import '../../../generated/assets.dart';
import '../../custom/custom_text/custom_text.dart';
import '../../custom/custom_text_from_field/custom_text_from_field.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar2(
          showBackButton: false,
          centertitle: false,
          title: "Jobs",
          actions: [
            CommonImageView(svgPath: Assets.svgNotification),
            12.horizontalSpace,
          ],
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SearchField(),
          ),
          12.verticalSpace,
          TabBar(
            labelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: "inter",
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: "inter",
            ),
            labelColor: kPrimaryColor, // Selected tab color
            unselectedLabelColor: kTextSecondary2Color, // Unselected tab color
            indicatorColor: kPrimaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: "Ongoing Service"),
              Tab(text: "Cancelled Service"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Container(
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
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                CommonImageView(
                                  imagePath: Assets.imagesGorliax,
                                  height: 32,
                                ),
                                8.horizontalSpace,
                                FreelanceMarketText(
                                  "Gorliax",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                Spacer(),
                                CommonImageView(
                                  svgPath: Assets.svgHeart,

                                ),
                              ],
                            ),
                            5.verticalSpace,
                            FreelanceMarketText(
                              "UI/UX Designer",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                            5.verticalSpace,
                            Row(
                              children: [
                                FreelanceMarketText(
                                  "Mid-Level",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: kTextSecondary2Color,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Container(
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                      color: kTextSecondary2Color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                FreelanceMarketText(
                                  "Full-Time",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: kTextSecondary2Color,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Container(
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(
                                      color: kTextSecondary2Color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                FreelanceMarketText(
                                  "Onsite",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: kTextSecondary2Color,
                                ),
                              ],
                            ),
                            10.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FreelanceMarketText(
                                  "\$100k - \$120k/yearly",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                                FreelanceMarketText(
                                  "Edited on 20 July",
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: kTextSecondary2Color,
                                ),
                              ],
                            ),
                            12.verticalSpace,
                            Divider(
                              color: kBackgroundColor,
                            )
                          ],
                        ),
                      );
                    },)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Container(
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
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(12),
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    CommonImageView(
                                      imagePath: Assets.imagesGorliax,
                                      height: 32,
                                    ),
                                    8.horizontalSpace,
                                    FreelanceMarketText(
                                      "Gorliax",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: ShapeDecoration(
                                        color: const Color(0x21FF3A3A),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(22),
                                        ),
                                      ),
                                      child: FreelanceMarketText(
                                          "Cancelled",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: kRed2Color,
                                      ),
                                    )
                                  ],
                                ),
                                5.verticalSpace,
                                FreelanceMarketText(
                                  "UI/UX Designer",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                5.verticalSpace,
                                Row(
                                  children: [
                                    FreelanceMarketText(
                                      "Mid-Level",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: kTextSecondary2Color,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      child: Container(
                                        height: 4,
                                        width: 4,
                                        decoration: BoxDecoration(
                                          color: kTextSecondary2Color,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    FreelanceMarketText(
                                      "Full-Time",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: kTextSecondary2Color,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      child: Container(
                                        height: 4,
                                        width: 4,
                                        decoration: BoxDecoration(
                                          color: kTextSecondary2Color,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    FreelanceMarketText(
                                      "Onsite",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: kTextSecondary2Color,
                                    ),
                                  ],
                                ),
                                10.verticalSpace,
                                Row(

                                  children: [
                                    CommonImageView(
                                      svgPath: Assets.svgNotificationBing,
                                    ),
                                    5.horizontalSpace,
                                    FreelanceMarketText(
                                      "Application viewed 1w ago",
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: kTextSecondary2Color,
                                    ),
                                  ],
                                ),
                                12.verticalSpace,
                                Divider(
                                  color: kBackgroundColor,
                                )
                              ],
                            ),
                          );
                        },)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
