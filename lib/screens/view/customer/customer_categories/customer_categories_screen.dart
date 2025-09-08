import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/common_image_widget/common_image_widget.dart';
import 'package:freelance_market/screens/custom/custom_app_bar/custom_app_bar.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';
import '../../../../config/constant/colors.dart';
import '../../../../generated/assets.dart';

class CustomerCategoriesScreen extends StatelessWidget {
  const CustomerCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Main Tabs: Categories & Interests
      child: Scaffold(
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
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        /// Main TabBar
        TabBar(
          labelColor: kPrimaryColor,
          unselectedLabelColor: kTextSecondaryColor,
          indicatorColor: kPrimaryColor,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          tabs: const [
            Tab(text: "Categories"),
            Tab(text: "Interests"),
          ],
        ),

        /// Main TabBarView
        Expanded(
          child: TabBarView(
            children: [
              /// First Tab: Categories with nested tabs
              DefaultTabController(
                length: 4, // Nested Tabs
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      labelColor: kPrimaryColor,
                      unselectedLabelColor: kTextPrimaryColor,
                      indicatorColor: kPrimaryColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 1, color: kPrimaryColor), // thickness
                        //insets: EdgeInsets.symmetric(horizontal: 16), // shorten underline
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      tabs: const [
                        Tab(text: "Photographers"),
                        Tab(text: "Editors"),
                        Tab(text: "Tutors"),
                        Tab(text: "Logo Designers"),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
                        child: TabBarView(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                categoryItem(
                                  title: "Graphics & Design",
                                  description: "incidunt facilisis tincidunt adipiscing tincidunt risus libero, quam sapien..",
                                ),
                                15.verticalSpace,
                                categoryItem(
                                  title: "Digital Design",
                                  description: "incidunt facilisis tincidunt adipiscing tincidunt risus libero, quam sapien..",
                                ),
                                15.verticalSpace,
                                categoryItem(
                                  title: "Writing & Translation",
                                  description: "incidunt facilisis tincidunt adipiscing tincidunt risus libero, quam sapien..",
                                ),
                                15.verticalSpace,
                                categoryItem(
                                  title: "Video Animation",
                                  description: "incidunt facilisis tincidunt adipiscing tincidunt risus libero, quam sapien..",
                                ),
                                15.verticalSpace,
                                categoryItem(
                                  title: "Music & Audio",
                                  description: "incidunt facilisis tincidunt adipiscing tincidunt risus libero, quam sapien..",
                                ),


                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// Second Tab: Interests
              Center(child: Text("Interests Content")),
            ],
          ),
        ),
      ],
    );
  }
  Widget categoryItem({
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FreelanceMarketText(
          title,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        6.verticalSpace,
        FreelanceMarketText(
          description,
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

}
