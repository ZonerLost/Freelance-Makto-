import 'package:freelance_market/screens/view/choose_your_role_screen/choose_your_role_screen.dart';

import '../../screens/view/auth/creat_account_screen/create_account_screen.dart';
import '../../screens/view/auth/login_screen/login_screen.dart';
import 'routes_names.dart';
import 'package:get/route_manager.dart';
import '../../screens/splash_service/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(name: RouteName.splashScreen, page: () => SplashScreen()),

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
  ];
}
