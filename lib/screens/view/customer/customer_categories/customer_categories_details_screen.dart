import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/custom_app_bar/custom_app_bar.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';

import '../../../../config/constant/colors.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_widget/common_image_widget.dart';


class CustomerCategoriesDetailsScreen extends StatelessWidget {
  const CustomerCategoriesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        showBackButton: false,
        centertitle: false,
        title: "Categories",
        actions: [
          CommonImageView(svgPath: Assets.svgSearchGrey),
          15.horizontalSpace,
        ],
      ),
      body: _body(),
    );
  }
  _body(){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          10.verticalSpace,
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 20.w),
            child: FreelanceMarketText(
              "incidunt facilisis tincidunt adipiscing tincidunt risus libero, quam sapien..",
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFDDDDDD),
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: CommonImageView(
                    svgPath: Assets.svgMenu,
                  ),
                ),
                10.horizontalSpace,
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFDDDDDD),
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child:Row(
                    children: [
                      FreelanceMarketText(
                        "Categories",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      4.horizontalSpace,
                      Icon( Icons.arrow_drop_down,size: 18,),
                    ],
                  ),
                ),
                10.horizontalSpace,
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: const Color(0xFFDDDDDD),
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child:Row(
                    children: [
                      FreelanceMarketText(
                        "Popular",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      4.horizontalSpace,
                      Icon( Icons.arrow_drop_down,size: 18,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          15.verticalSpace,
          Divider(color: kCDDColor,),
          CustomerCategoriesGridScreen(),
        ],
      ),
    );
  }
}






class CustomerCategoriesGridScreen extends StatelessWidget {
  const CustomerCategoriesGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 16, // Example: 6 items
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.89, // Adjust height ratio
      ),
      itemBuilder: (context, index) {
        return buildCategoryCard();
      },
    );
  }

  Widget buildCategoryCard() {
    return Container(
      width: 200.w,
      padding: const EdgeInsets.all(7),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0x0C226399),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonImageView(imagePath: Assets.imagesPp1),
          10.verticalSpace,
          Row(
            children: [
              CommonImageView(
                imagePath: Assets.imagesProfile,
                height: 22,
                radius: 50,
              ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FreelanceMarketText(
                      "Sam William",
                      fontSize: 7,
                      fontWeight: FontWeight.w500,
                    ),
                    FreelanceMarketText(
                      "Photographer",
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
              CommonImageView(svgPath: Assets.svgHeartLike),
            ],
          ),
          5.verticalSpace,
          FreelanceMarketText(
            "incidunt facilisis tincidunt adipiscing tincidunt risus libero, quam sapien..",
            fontSize: 8,
            fontWeight: FontWeight.w400,
          ),
          6.verticalSpace,
          Row(
            children: [
              CommonImageView(svgPath: Assets.svgStar),
              4.horizontalSpace,
              FreelanceMarketText(
                "5.0",
                fontSize: 8,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              FreelanceMarketText(
                "From",
                fontSize: 8,
                fontWeight: FontWeight.w300,
              ),
              4.horizontalSpace,
              FreelanceMarketText(
                "\$ 20",
                fontSize: 8,
                fontWeight: FontWeight.w700,
              ),
            ],
          )
        ],
      ),
    );
  }
}
