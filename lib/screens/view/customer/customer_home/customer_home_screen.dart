import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/custom_app_bar/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../config/constant/colors.dart';
import '../../../../config/routes/routes_names.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_widget/common_image_widget.dart';
import '../../../custom/custom_text/custom_text.dart';
import '../../../custom/custom_text_from_field/custom_text_from_field.dart';


class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

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
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,),
              child: SearchField(),
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
            20.verticalSpace,
            Divider(color: kCDDColor,),
            18.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,),
              child: FreelanceMarketText(
                "Popular Services",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    width: 220,
                    padding: EdgeInsets.all(7),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0x0C226399),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonImageView(imagePath: Assets.imagesPp1,),
                        6.verticalSpace,
                        FreelanceMarketText(
                          "Photography",
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                          ,
                        ),
                      ],
                    ),
                  ),
                );
              },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,),
              child: Container(
                width: 341,
                height: 145,
                padding: EdgeInsets.all(15),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0x0C226399),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FreelanceMarketText(
                      "Get unlimited\nServices with Us",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    10.verticalSpace,
                    FreelanceMarketText(
                      "incidunt facilisis tincidunt adipiscing tincidunt\nrisus libero, quam sapien..",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,),
              child: FreelanceMarketText(
                "Recently viewed & more",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 210.h,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Container(
                      width: 200.w,
                      padding: EdgeInsets.all(7),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0x0C226399),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonImageView(imagePath: Assets.imagesPp1,),
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
                              CommonImageView(
                                svgPath: Assets.svgHeartLike,
                              )
                            ],
                          ),
                          5.verticalSpace,
                          FreelanceMarketText(
                            "incidunt facilisis tincidunt adipiscing tincidunt risus libero, quam sapien..",
                            fontSize: 8,
                            fontWeight: FontWeight.w400
                            ,
                          ),
                          6.verticalSpace,
                          Row(
                            children: [
                              CommonImageView(svgPath: Assets.svgStar,),
                              4.horizontalSpace,
                              FreelanceMarketText(
                                "5.0",
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                              ),
                              Spacer(),
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
                    ),
                  );
                },
              ),
            ),
          ],

        ),
      ),
    );
  }
}
