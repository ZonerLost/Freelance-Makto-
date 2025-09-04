import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/common_image_widget/common_image_widget.dart';
import 'package:freelance_market/screens/view/home/job_details_screen/tabs.dart';

import '../../../../config/constant/colors.dart';
import '../../../../generated/assets.dart';
import '../../../custom/custom_app_bar/custom_app_bar.dart';
import '../../../custom/custom_text/custom_text.dart';



class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Service Details",
        actions: [
          CommonImageView(
            svgPath: Assets.svgVector,
          ),
          SizedBox(width: 15,)
        ],
      ),
        body: _body());
  }

  _body() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonImageView(
                  imagePath: Assets.imagesProfile,
                  height: 75,
                ),
                Container(
                  width: 96,
                  height: 48,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FreelanceMarketText(
                        "Edit",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: kWhiteColor,
                      ),
                      8.horizontalSpace,
                      CommonImageView(
                        svgPath: Assets.svgPen,
                      )
                    ],
                  ),
                )

              ],
            ),
            17.verticalSpace,
            FreelanceMarketText(
              "Photographer",
              fontSize: 18,
              fontWeight: FontWeight.w700,


            ),
            8.verticalSpace,
            FreelanceMarketText(
              "Kevin Thomas",
              fontSize: 14,
              fontWeight: FontWeight.w600,


            ),
            FreelanceMarketText(
              "Posted on 20 July",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: kTextSecondaryColor,


            ),
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FreelanceMarketText(
                        "Experience Level",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kTextSecondaryColor,


                      ),
                      3.verticalSpace,
                      FreelanceMarketText(
                        "Mid-Level",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,


                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FreelanceMarketText(
                        "Job Type",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kTextSecondaryColor,


                      ),
                      3.verticalSpace,
                      FreelanceMarketText(
                        "Full-Time",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,


                      ),

                    ],
                  ),
                ),
              ],
            ),
            15.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FreelanceMarketText(
                        "Service Nature",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kTextSecondaryColor,


                      ),
                      3.verticalSpace,
                      FreelanceMarketText(
                        "Onsite",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,


                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FreelanceMarketText(
                        "Pricing",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kTextSecondaryColor,


                      ),
                      3.verticalSpace,
                      FreelanceMarketText(
                        "\$25",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,


                      ),

                    ],
                  ),
                ),
              ],
            ),
            40.verticalSpace,
            SelectableTabsRow(),



          ],
        ),
      ),
    );
  }
}
