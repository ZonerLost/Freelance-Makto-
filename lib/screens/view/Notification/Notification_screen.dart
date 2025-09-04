import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_market/screens/custom/common_image_widget/common_image_widget.dart';
import 'package:freelance_market/screens/custom/custom_app_bar/custom_app_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:freelance_market/screens/custom/custom_text/custom_text.dart';

import '../../../config/constant/colors.dart';
import '../../../generated/assets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      appBar: CustomAppBar2(title: "Notifications"),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FreelanceMarketText(
              "Today",
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            SlideableItemWithPackage(
              title: "Lorem ipsum dolor sit amet",
              subtitle: "2 minutes ago",
            ),
            SlideableItemWithPackage(
              title: "Lorem ipsum dolor sit amet",
              subtitle: "2 minutes ago",
            ),
            SlideableItemWithPackage(
              title: "Lorem ipsum dolor sit amet",
              subtitle: "2 minutes ago",
            ),
            15.verticalSpace,
            FreelanceMarketText(
              "Past",
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            SlideableItemWithPackage(
              title: "Lorem ipsum dolor sit amet",
              subtitle: "2 minutes ago",
            ),
            SlideableItemWithPackage(
              title: "Lorem ipsum dolor sit amet",
              subtitle: "2 minutes ago",
            ),
            SlideableItemWithPackage(
              title: "Lorem ipsum dolor sit amet",
              subtitle: "2 minutes ago",
            ),
          ],
        ),
      ),
    );
  }
}

class SlideableItemWithPackage extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onDelete;

  const SlideableItemWithPackage({
    super.key,
    required this.title,
    required this.subtitle,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 6),
      child: Slidable(
        key: ValueKey(title),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => onDelete?.call(),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(8),
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              CommonImageView(imagePath: Assets.imagesBell,height: 50,),
              20.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FreelanceMarketText(
                    title,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 4),
                  FreelanceMarketText(
                    subtitle,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: kTextSecondaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
