import 'package:get/get.dart';
import 'package:project_one/views/bottom/bottom_bar_screen.view.dart';
import 'package:project_one/views/location/location_screen.views.dart';
import 'package:project_one/views/phoneVerification/phone_verification.views.dart';
import 'package:project_one/views/splash/splash_screen.views.dart';

class RouteHelper {
  static const String initial = "/";
  static const String splash = "/splash";
  static const String phoneVerification = "/phone-verification";
  static const String locationScreen = "/location-screen";

  static String getSplashScreen() => "$splash";

  static String getInitialScreen() => "$initial";

  static String getPhoneVerificationScreen() => "$phoneVerification";

  static String getLocationScreen() => "$locationScreen";

  static List<GetPage> routes = [
    GetPage(
        name: splash,
        page: () {
          return const SplashScreen();
        }),
    GetPage(
        name: initial,
        page: () {
          return const InitialScreen();
        }),
    GetPage(
        name: phoneVerification,
        page: () {
          return const PhoneVerificationScreen();
        }),
    GetPage(
        name: locationScreen,
        page: () {
          return const LocationScreen();
        }),
  ];
}
