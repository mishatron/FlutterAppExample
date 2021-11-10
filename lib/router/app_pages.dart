import 'package:flutter_app_example/router/route_paths.dart';
import 'package:flutter_app_example/src/ui/addition/addition_screen.dart';
import 'package:flutter_app_example/src/ui/home/home_screen.dart';
import 'package:flutter_app_example/src/ui/login/login_screen.dart';
import 'package:flutter_app_example/src/ui/main/main_screen.dart';
import 'package:flutter_app_example/src/ui/profile/profile_screen.dart';
import 'package:flutter_app_example/src/ui/splash/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static const String INITIAL = rootRoute;
  static const Duration transitionDuration = const Duration(milliseconds: 350);
  static final routes = [
    GetPage(
      name: rootRoute,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: loginRoute,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: mainScreenRoute,
      page: () => MainScreen(),
    ),
    GetPage(
        name: AdditionScreenRoute,
        page: () => AdditionScreen()
    ),
  ];
  static final unknownRoutePage =
      GetPage(name: rootRoute, page: () => SplashScreen());
}
