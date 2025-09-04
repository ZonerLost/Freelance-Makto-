import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/common_image_widget/common_image_widget.dart';
import 'package:freelance_market/screens/custom/custom_app_bar/custom_app_bar.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../config/constant/colors.dart';
import '../../../../generated/assets.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "FAQs"),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            ExpandableCard(
              title: "Sed nec facilisis velit?",
              description:
                  "Integer posuere, velit sit amet aliquam posuere, odio odio mattis mi, "
                  "vel dictum magna turpis vitae arcu. Sed quis ultrices neque. "
                  "Vivamus ullamcorper arcu non erat laoreet, vel rhoncus quam volutpat.",
            ),
            10.verticalSpace,
            ExpandableCard(
              title: "Sed nec facilisis velit?",
              description:
                  "Integer posuere, velit sit amet aliquam posuere, odio odio mattis mi, "
                  "vel dictum magna turpis vitae arcu. Sed quis ultrices neque. "
                  "Vivamus ullamcorper arcu non erat laoreet, vel rhoncus quam volutpat.",
            ),
            10.verticalSpace,
            ExpandableCard(
              title: "Sed nec facilisis velit?",
              description:
                  "Integer posuere, velit sit amet aliquam posuere, odio odio mattis mi, "
                  "vel dictum magna turpis vitae arcu. Sed quis ultrices neque. "
                  "Vivamus ullamcorper arcu non erat laoreet, vel rhoncus quam volutpat.",
            ),
            10.verticalSpace,
            ExpandableCard(
              title: "Sed nec facilisis velit?",
              description:
                  "Integer posuere, velit sit amet aliquam posuere, odio odio mattis mi, "
                  "vel dictum magna turpis vitae arcu. Sed quis ultrices neque. "
                  "Vivamus ullamcorper arcu non erat laoreet, vel rhoncus quam volutpat.",
            ),
            10.verticalSpace,
            ExpandableCard(
              title: "Sed nec facilisis velit?",
              description:
                  "Integer posuere, velit sit amet aliquam posuere, odio odio mattis mi, "
                  "vel dictum magna turpis vitae arcu. Sed quis ultrices neque. "
                  "Vivamus ullamcorper arcu non erat laoreet, vel rhoncus quam volutpat.",
            ),
            10.verticalSpace,
            ExpandableCard(
              title: "Sed nec facilisis velit?",
              description:
                  "Integer posuere, velit sit amet aliquam posuere, odio odio mattis mi, "
                  "vel dictum magna turpis vitae arcu. Sed quis ultrices neque. "
                  "Vivamus ullamcorper arcu non erat laoreet, vel rhoncus quam volutpat.",
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableCard extends StatelessWidget {
  final String title;
  final String description;
  final double borderRadius;

  ExpandableCard({
    super.key,
    required this.title,
    required this.description,
    this.borderRadius = 8,
  });

  final RxBool isExpanded = false.obs; // Reactive variable

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: isExpanded.value ? kPrimaryLightColor : kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x07000000),
            blurRadius: 14,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: isExpanded.value ? kPrimaryColor : kWhiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: InkWell(
              onTap: () => isExpanded.toggle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FreelanceMarketText(
                    title,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isExpanded.value
                        ? kWhiteColor
                        : kTextPrimaryColor,
                  ),
                  CommonImageView(
                    svgPath: isExpanded.value ? Assets.svgArrowUp   :Assets.svgDownArrow,

                  ),
                ],
              ),
            ),
          ),
          if (isExpanded.value)
            Padding(
              padding: const EdgeInsets.all(16),
              child: FreelanceMarketText(
                description,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                lineHeight: 1.83,
                color: kTextSecondary2Color,
                textAlign: TextAlign.justify,
              ),
            ),
        ],
      ),
    ));
  }
}

