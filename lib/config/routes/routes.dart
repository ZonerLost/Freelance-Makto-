import 'package:freelance_market/screens/view/Notification/Notification_screen.dart';
import 'package:freelance_market/screens/view/availability_screen/availability_screen.dart';
import 'package:freelance_market/screens/view/choose_your_role_screen/choose_your_role_screen.dart';
import 'package:freelance_market/screens/view/educational_background_screens/review_education_screen/review_education_screen.dart';
import '../../screens/view/Inbox/chat_screen.dart';
import '../../screens/view/Inbox/inbox_screen.dart';
import '../../screens/view/Inbox/schedule_meeting_screen.dart';
import '../../screens/view/auth/creat_account_screen/create_account_screen.dart';
import '../../screens/view/auth/login_screen/login_screen.dart';
import '../../screens/view/contact_details_screen/contact_details_screen.dart';
import '../../screens/view/educational_background_screens/educational_background_screen/educational_background_screen.dart';
import '../../screens/view/home/home_screen/home_screen.dart';
import '../../screens/view/home/job_details_screen/job_details_screen.dart';
import '../../screens/view/job/job_screen.dart';
import '../../screens/view/preferred_service_type_screen/preferred_service_type_screen.dart';
import '../../screens/view/profile/account_setting/account_setting_screen.dart';
import '../../screens/view/profile/faqs/faqs_screen.dart';
import '../../screens/view/profile/favourite/favourite_screen.dart';
import '../../screens/view/profile/job_seeker_profile/job_seeker_profile_screen.dart';
import '../../screens/view/profile/language/language_screen.dart';
import '../../screens/view/profile/privacy_policy/privacy_policy_screen.dart';
import '../../screens/view/profile/privacy_policy/term_and_condition_screen.dart';
import '../../screens/view/profile/setting_screen/setting_screen.dart';
import '../../screens/view/skills_competencies_screen/skills_competencies_screen.dart';
import '../../screens/view/subscription/subscription_screen.dart';
import '../../screens/view/work_experience_screen/work_experience_screen.dart';
import 'routes_names.dart';
import 'package:get/route_manager.dart';
import '../../screens/splash_service/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(name: RouteName.splashScreen, page: () => JobSeekerProfileScreen()),

    ///
    /// Auth
    ///
    GetPage(name: RouteName.loginScreen, page: () => LoginScreen()),
    GetPage(
      name: RouteName.createAccountScreen,
      page: () => CreateAccountScreen(),
    ),

    // Add more routes here as needed
    GetPage(
      name: RouteName.chooseYourRoleScreen,
      page: () => const ChooseYourRoleScreen(),
    ),

    GetPage(
      name: RouteName.contactDetailsScreen,
      page: () => const ContactDetailsScreen(),
    ),

    GetPage(
      name: RouteName.educationalBackgroundScreen,
      page: () => const EducationalBackgroundScreen(),
    ),

    GetPage(
      name: RouteName.reviewEducationScreen,
      page: () => const ReviewEducationScreen(),
    ),

    GetPage(
      name: RouteName.workExperienceScreen,
      page: () => const WorkExperienceScreen(),
    ),

    GetPage(
      name: RouteName.skillsCompetenciesScreen,
      page: () => const SkillsCompetenciesScreen(),
    ),

    GetPage(
      name: RouteName.preferredServiceTypeScreen,
      page: () => const PreferredServiceTypeScreen(),
    ),

    GetPage(
      name: RouteName.availabilityScreen,
      page: () => const AvailabilityScreen(),
    ),

    GetPage(
      name: RouteName.homeScreen,
      page: () => const HomeScreen(),
    ),


    GetPage(
      name: RouteName.jobDetailsScreen,
      page: () => const JobDetailsScreen(),
    ),

    GetPage(
      name: RouteName.notificationScreen,
      page: () => const NotificationScreen(),
    ),

    GetPage(
      name: RouteName.jobScreen,
      page: () => const JobScreen(),
    ),

    GetPage(
      name: RouteName.subscriptionScreen,
      page: () =>  SubscriptionScreen(),
    ),

    GetPage(
      name: RouteName.inboxScreen,
      page: () =>  InboxScreen(),
    ),


    GetPage(
      name: RouteName.scheduleMeetingScreen,
      page: () =>  ScheduleMeetingScreen(),
    ),

    GetPage(
      name: RouteName.jobSeekerProfileScreen,
      page: () =>  JobSeekerProfileScreen(),
    ),

    GetPage(
      name: RouteName.favouriteScreen,
      page: () =>  FavouriteScreen(),
    ),


    GetPage(
      name: RouteName.languageScreen,
      page: () =>  LanguageScreen(),
    ),

    GetPage(
      name: RouteName.privacyPolicyScreen,
      page: () =>  PrivacyPolicyScreen(),
    ),

    GetPage(
      name: RouteName.termAndConditionScreen,
      page: () =>  TermAndConditionScreen(),
    ),


    GetPage(
      name: RouteName.faqsScreen,
      page: () =>  FaqsScreen(),
    ),

    GetPage(
      name: RouteName.settingScreen,
      page: () =>  SettingScreen(),
    ),

    GetPage(
      name: RouteName.accountSettingScreen,
      page: () =>  AccountSettingScreen(),
    ),



  ];
}
