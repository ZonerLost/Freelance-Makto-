import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:freelance_market/screens/custom/custom_app_bar/custom_app_bar.dart';
import 'package:freelance_market/screens/custom/custom_button/custom_button.dart';
import 'package:get/get.dart';
import '../../../../config/constant/colors.dart';
import '../../../../controllers/onboarding_process_controller/onboarding_process_controller.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_widget/common_image_widget.dart';
import '../../../custom/custom_text/custom_text.dart';
import '../../../custom/custom_text_from_field/custom_text_from_field.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});


  final onboardingProcessController = Get.put(OnboardingProcessController());
  final RxInt selectedIndex = 0.obs;

  final List<String> categories = [
    "Education",
    "Work Experience",
    "Skills",
    "Upload Work",
  ];
  final List<String> items = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Edit Profile",
      ),
      bottomNavigationBar: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: FreelanceMarketButton(label: "Save changes", onPressed: (){}),
      )),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        // Category Tabs
        15.verticalSpace,
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemBuilder: (context, index) {
              return Obx(() {
                final isSelected = selectedIndex.value == index;
                return GestureDetector(
                  onTap: () => selectedIndex.value = index,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: ShapeDecoration(
                      color:
                      isSelected ? kPrimaryColor : kBackgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: isSelected
                              ? kWhiteColor
                              : kTextSecondary2Color,
                        ),
                      ),
                    ),
                  ),
                );
              });
            },
          ),
        ),

        // Category Content
        Expanded(
          child: Obx(() {
            Widget content;

            switch (selectedIndex.value) {
              case 0:
                content = _educationWidget();
                break;
              case 1:
                content = _workExperienceWidget();
                break;
              case 2:
                content = _skillsWidget();
                break;
              case 3:
                content = _uploadWorkWidget();
                break;
              default:
                content = const SizedBox();
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: content,
            );
          }),
        ),
      ],
    );
  }

  // Example category widgets
  Widget _educationWidget() {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 15.h),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
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
                CommonImageView(imagePath: Assets.imagesEdu,height: 50,),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FreelanceMarketText(
                        "Montreal School of Sciences",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      3.verticalSpace,
                      FreelanceMarketText(
                        "BS Computer Science",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kTextSecondary2Color,
                      ),
                      5.verticalSpace,
                      FreelanceMarketText(
                        "May 2019 - July 2023",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kTextSecondary2Color,
                      ),
                    ],
                  ),
                ),
                CommonImageView(
                  imagePath: Assets.imagesMore,
                  height: 25,
                ),

              ],
            ),
          ),
          15.verticalSpace,
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonImageView(svgPath: Assets.svgAddCircle,),
                  5.horizontalSpace,
                  FreelanceMarketText(
                    "Add more",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kWhiteColor,
                  )
                ],
              ),
            ),
          )



        ],
      ),
    );
  }

  Widget _workExperienceWidget() {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 15.h),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
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
                CommonImageView(imagePath: Assets.imagesExp,height: 50,),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FreelanceMarketText(
                        "Photographer",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      3.verticalSpace,
                      FreelanceMarketText(
                        "Manchester",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kTextSecondary2Color,
                      ),
                      5.verticalSpace,
                      FreelanceMarketText(
                        "May 2019 - July 2023",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kTextSecondary2Color,
                      ),
                    ],
                  ),
                ),
                CommonImageView(
                  imagePath: Assets.imagesMore,
                  height: 25,
                ),

              ],
            ),
          ),
          15.verticalSpace,
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: ShapeDecoration(
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonImageView(svgPath: Assets.svgAddCircle,),
                  5.horizontalSpace,
                  FreelanceMarketText(
                    "Add more",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kWhiteColor,
                  )
                ],
              ),
            ),
          )



        ],
      ),
    );
  }

  Widget _skillsWidget() {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          FreelanceMarketTextField(
            controller: TextEditingController(),
            borderColor: kBackgroundColor,
            hintText: "Add a skill (e.g Typing)",
            suffixIcon: Icons.arrow_drop_down,
          ),
          16.verticalSpace,
          Wrap(
            spacing: 10.w,
            runSpacing: 12.h,
            children: onboardingProcessController.skillsList.map((
                skill,
                ) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FreelanceMarketText(
                      skill,
                      fontSize: 14,
                      color: kWhiteColor,
                    ),
                    4.horizontalSpace,
                    Icon(Icons.close, color: kWhiteColor),
                  ],
                ),
              );
            }).toList(),
          ),

          24.verticalSpace,

          FreelanceMarketText(
            'Recommended Skills',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),

          12.verticalSpace,

          Wrap(
            spacing: 10.w,
            runSpacing: 12.h,
            children: onboardingProcessController.recommendedSkillsList
                .map((skill) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(16.r),
                  border: BoxBorder.all(color: kPrimaryColor),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FreelanceMarketText(
                      skill,
                      fontSize: 14,
                      color: kPrimaryColor,
                    ),
                    4.horizontalSpace,
                    Icon(Icons.close, color: kPrimaryColor),
                  ],
                ),
              );
            })
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _uploadWorkWidget() {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 15.h),
        child: Column(
          children: [
            MasonryGridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3, // Reduced for better mobile layout
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return CommonImageView(imagePath: items[index]);
              },
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
            ),
            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonImageView(
                  svgPath: Assets.svgAddCircleBlue,
                ),
                4.horizontalSpace,
                FreelanceMarketText(
                  "Add more",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}
