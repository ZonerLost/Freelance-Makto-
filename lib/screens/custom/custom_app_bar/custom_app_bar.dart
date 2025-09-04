import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constant/colors.dart';
import '../../../generated/assets.dart';
import '../common_image_widget/common_image_widget.dart';
import '../custom_text/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const CustomAppBar({Key? key, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0x07000000),
            blurRadius: 14,
            offset: const Offset(2, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: kWhiteColor,
        title: CommonImageView(svgPath: Assets.imagesArrowBack),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? onBackTap;
  final Widget? child;
  final showBackButton,centertitle; // 👈 Added child property

  const CustomAppBar2({
    Key? key,
    this.title,
    this.actions,
    this.onBackTap,
    this.child,
    this.showBackButton = true,
    this.centertitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0x07000000),
            blurRadius: 14,
            offset: const Offset(2, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),

        child: AppBar(
          centerTitle: centertitle,
          automaticallyImplyLeading: false,
          //titleSpacing: 0,
          backgroundColor: kWhiteColor,

          leading: showBackButton
              ? InkWell(
                  onTap: onBackTap ?? () => Get.back(),
                  child: CommonImageView(imagePath: Assets.imagesArrowBack,height: 36,),
                )
              : null,
          title: title != null
              ? FreelanceMarketText(
                  title!,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                )
              : child, // 👈 Fallback to custom widget if title is null
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
