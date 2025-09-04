import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/custom_app_bar/custom_app_bar.dart';

import '../../../../config/constant/colors.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_widget/common_image_widget.dart';
import '../../../custom/custom_text/custom_text.dart';



class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Favorites",
      ),
      body: _body(),
    );
  }
  _body(){
    return Padding(
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
                        CommonImageView(
                          svgPath: Assets.svgHeartLike,

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
                          "Saved 14 February",
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: kTextSecondary2Color,
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    if (index != 2 - 1) ...[
                      12.verticalSpace,
                      Divider(color: kBackgroundColor),
                    ]
                  ],
                ),
              );
            },)
      ),
    );
  }
}
