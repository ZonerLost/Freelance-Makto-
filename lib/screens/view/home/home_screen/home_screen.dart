import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/generated/assets.dart';
import 'package:freelance_market/screens/custom/common_image_widget/common_image_widget.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../config/constant/colors.dart';
import '../../../../config/routes/routes_names.dart';
import '../../../custom/custom_app_bar/custom_app_bar.dart';
import '../../../custom/custom_text_from_field/custom_text_from_field.dart';
import 'bottom_sheets/home_bottom_sheets.dart';
import 'earning_map.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      appBar: CustomAppBar(
        actions: [
          25.horizontalSpace,
          CommonImageView(
            imagePath: Assets.imagesProfile,
            height: 40,
            radius: 50,
          ),
          12.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FreelanceMarketText(
                "Greetings!",
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              FreelanceMarketText(
                "Kevin Thomas",
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteName.notificationScreen);
            },
            child: CommonImageView(
              svgPath: Assets.svgNotification,
            ),
          ),
          20.horizontalSpace,
        ],
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
          children: [
            SearchField(),
            10.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      HomeBottomSheet.reportServiceBottomSheet();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
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
                          CommonImageView(
                            imagePath: Assets.imagesRating,
                            height: 36,
                          ),
                          6.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FreelanceMarketText(
                                "Ratings",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kTextSecondary2Color,
                              ),
                              4.verticalSpace,
                              FreelanceMarketText(
                                "4.0",
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      HomeBottomSheet.rateClientBottomSheet();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
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
                          CommonImageView(
                            imagePath: Assets.imagesResponseRate,
                            height: 36,
                          ),
                          6.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FreelanceMarketText(
                                "Response Rate",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kTextSecondary2Color,
                              ),
                              4.verticalSpace,
                              FreelanceMarketText(
                                "100%",
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            EarningsDashboard(),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FreelanceMarketText(
                  "My Services",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                FreelanceMarketText(
                  "View details",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor,
                ),
              ],
            ),
              12.verticalSpace,
           ListView.builder(
             shrinkWrap: true,
             physics: NeverScrollableScrollPhysics(),
             itemCount: 5,
             itemBuilder: (context, index) {
             return  Padding(
               padding: const EdgeInsets.only(bottom: 8.0),
               child: GestureDetector(
                 onTap: (){
                   Get.toNamed(RouteName.jobDetailsScreen);
                 },
                 child: Container(
                   width: double.infinity,
                   padding: const EdgeInsets.all(10),
                   decoration: ShapeDecoration(
                     color: kCBGColor,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),
                     ),
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       FreelanceMarketText(
                         "Videographer",
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
                             padding: const EdgeInsets.symmetric(horizontal: 5),
                             child: Container(
                               height: 4,
                               width: 4,
                               decoration: BoxDecoration(
                                   color: kTextSecondary2Color,
                                   shape: BoxShape.circle
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
                             padding: const EdgeInsets.symmetric(horizontal: 5),
                             child: Container(
                               height: 4,
                               width: 4,
                               decoration: BoxDecoration(
                                   color: kTextSecondary2Color,
                                   shape: BoxShape.circle
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
                             "Starting from \$10",
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
                       )
                     ],
                   ),
                 ),
               ),
             );
           },
           ),

          ],
        ),
      ),
    );
  }
}
