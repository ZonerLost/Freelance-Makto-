import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/constant/colors.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_widget/common_image_widget.dart';
import '../../custom/custom_app_bar/custom_app_bar.dart';
import '../../custom/custom_text/custom_text.dart';
import '../../custom/custom_text_from_field/custom_text_from_field.dart';




class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          25.horizontalSpace,
          FreelanceMarketText(
            "Inbox",
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          Spacer(),
          CommonImageView(
            svgPath: Assets.svgNotification,
          ),
          20.horizontalSpace,
        ],
      ),
      body: _body(),
    );
  }
  _body(){
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            SearchField(),
            10.verticalSpace,
            Container(
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: Colors.white,
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
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 12,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        CommonImageView(
                          imagePath: Assets.imagesProfile,
                          height: 40,
                          radius: 50,
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  FreelanceMarketText(
                                    "Robin Karleys",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  FreelanceMarketText(
                                    "12:13 Pm",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  FreelanceMarketText(
                                    "typing...",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: kTextSecondary2Color,
                                  ),
                                  if(index <= 1)
                                  Container(
                                    width: 20,
                                    height: 20,
                                    padding: const EdgeInsets.all(2.95),
                                    decoration: ShapeDecoration(
                                      color: kPrimaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(147.47),
                                      ),
                                    ),
                                    child: Center(
                                      child: FreelanceMarketText(
                                        "7",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: kWhiteColor,
                                      ),
                                    ),
                                  ),
                                  if(index >= 2)
                                    CommonImageView(
                                      svgPath: Assets.svgSendReceiver,
                                    )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    12.verticalSpace,
                    Divider(color: kBackgroundColor,)
                  ],
                );
              },),
            ),

          ],
        ),
      ),
    );

  }
}
