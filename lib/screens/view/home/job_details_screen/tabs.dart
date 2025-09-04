import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:freelance_market/generated/assets.dart';
import 'package:freelance_market/screens/custom/common_image_widget/common_image_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../config/constant/colors.dart';
import '../../../custom/custom_text/custom_text.dart';
import '../../../custom/rating_widget/rating_widget.dart';
import '../../../custom/read_more_widget/read_more_widget.dart';

class SelectableTabsRow extends StatelessWidget {
  final RxInt selectedIndex = 0.obs;
  final List<String> tabs = ["Description", "Work", "Reviews"];

  // List of tab content widgets
  final List<Widget> tabContents = [
    const DescriptionTab(),
    WorkTab(
      items: [
        Assets.imagesW1,
        Assets.imagesW2,
        Assets.imagesW3,
        Assets.imagesW1,
        Assets.imagesW2,
        Assets.imagesW3,
        Assets.imagesW1,
        Assets.imagesW2,
        Assets.imagesW3,
        Assets.imagesW1,
        Assets.imagesW2,
        Assets.imagesW3,
      ],
    ),
    const ReviewsTab(),
  ];

  SelectableTabsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          // Tabs Row
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(tabs.length, (index) {
                final isSelected = selectedIndex.value == index;

                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 0 : 12),
                  child: GestureDetector(
                    onTap: () => selectedIndex.value = index,
                    child: Container(
                      width: 95.w,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: isSelected ? kPrimaryColor : kBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: FreelanceMarketText(
                          tabs[index],
                          fontSize: 14,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isSelected ? kWhiteColor : kTextPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          SizedBox(height: 10.h),

          // Show the selected tab content
          tabContents[selectedIndex.value],
        ],
      ),
    );
  }
}

class DescriptionTab extends StatelessWidget {
  const DescriptionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: kWhiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        shadows: [
          BoxShadow(
            color: Color(0x07000000),
            blurRadius: 14,
            offset: Offset(2, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FreelanceMarketText(
            "Service Description",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          8.verticalSpace,
          ReadMoreText(
            text:
                "Hi, Myself Kevin and I have 5-7 years of experience overseeing the Photography",
            trimLines: 1, // Number of lines before "Read more" appears
          ),
          24.verticalSpace,
          FreelanceMarketText(
            "Features",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          8.verticalSpace,
          ReadMoreText(
            text: "I do Celebrities photoshoot, Wedding shoot.",
            trimLines: 1, // Number of lines before "Read more" appears
          ),
          24.verticalSpace,
          FreelanceMarketText(
            "Gadgets",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          8.verticalSpace,
          ReadMoreText(
            text: "Drone, Sony HD Camera, Lighting.",
            trimLines: 1, // Number of lines before "Read more" appears
          ),
        ],
      ),
    );
  }
}

class WorkTab extends StatelessWidget {
  final List<String> items; // List passed from outside

  const WorkTab({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3, // Reduced for better mobile layout
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return CommonImageView(imagePath: items[index]);
      },
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
    );
  }
}

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: kWhiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        shadows: [
          BoxShadow(
            color: Color(0x07000000),
            blurRadius: 14,
            offset: Offset(2, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FreelanceMarketText(
            "Reviews",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          12.verticalSpace,
          RatingWidget(
            averageRating: 4.4,
            totalRatings: 923,
            totalReviews: 257,
            ratingPercentages: {
              5: 67,
              4: 20,
              3: 79,
              2: 36,
              1: 50,
            },
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 8.h),
            child: Divider(
              color: kBackgroundColor,
            ),
          ),
          FreelanceMarketText(
            "Olivia Morgan",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          8.verticalSpace,
          Row(
            children: [
              RatingBar(
                size: 20,
                filledIcon: Icons.star_rate_rounded,
                emptyIcon: Icons.star_border_rounded,
                onRatingChanged: (value) => debugPrint('$value'),
                initialRating: 3,
                maxRating: 5,
              ),
              8.horizontalSpace,
              FreelanceMarketText(
                "4 months ago",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: kTextSecondaryColor,
              ),
            ],
          ),
          10.verticalSpace,
          SeeMoreText(text: 'Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus.',)
        ],
      ),
    );
  }
}
