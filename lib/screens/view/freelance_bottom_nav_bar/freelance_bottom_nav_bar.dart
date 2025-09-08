import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:freelance_market/screens/view/Inbox/inbox_screen.dart';
import 'package:freelance_market/screens/view/job/job_screen.dart';
import 'package:freelance_market/screens/view/profile/job_seeker_profile/job_seeker_profile_screen.dart';
import 'package:freelance_market/screens/view/subscription/subscription_screen.dart';
import 'package:get/get.dart';

import '../../../config/constant/colors.dart';
import '../../../generated/assets.dart';
import '../home/home_screen/home_screen.dart';

class FreelanceBottomNavBar extends StatefulWidget {
  const FreelanceBottomNavBar({super.key});

  @override
  State<FreelanceBottomNavBar> createState() => _FreelanceBottomNavBarState();
}

class _FreelanceBottomNavBarState extends State<FreelanceBottomNavBar> {
  final RxInt currentIndex = 0.obs;

  final List<Map<String, dynamic>> items = [
    {
      'icon': Assets.imagesHomeUnactive,
      'activeIcon': Assets.imagesHomeActive,
      'label': 'Home'
    },
    {
      'icon': Assets.imagesBriefcaseUnactive,
      'activeIcon': Assets.imagesBriefcaseActive,
      'label': 'Work'
    },
    {
      'icon': Assets.imagesMessageUnactive,
      'activeIcon': Assets.imagesMessageActive,
      'label': 'Chat'
    },
    {
      'icon': Assets.imagesCalendarUnactive,
      'activeIcon': Assets.imagesCalendarUnactive,
      'label': 'Calendar'
    },
    {
      'icon': Assets.imagesProfileUnactive,
      'activeIcon': Assets.imagesProfileActive,
      'label': 'Profile'
    },
  ];

  final List<Widget> screens = [
    HomeScreen(),
    JobScreen(),
    InboxScreen(),
    SubscriptionScreen(),
    JobSeekerProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        body: screens[currentIndex.value],
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length, (index) {
                final isActive = currentIndex.value == index;
                return GestureDetector(
                  onTap: () {
                    currentIndex.value = index;
                    log("Selected Index: $index");
                  },
                  child: Image.asset(
                    isActive ? items[index]['activeIcon'] : items[index]['icon'],
                    height: 28,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
