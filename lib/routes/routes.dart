import 'package:get/get.dart';
import 'package:meaw/View/screens/auth/forgot_password_screen.dart';
import 'package:meaw/View/screens/auth/login_screen.dart';
import 'package:meaw/View/screens/auth/signup_screen.dart';
import 'package:meaw/View/screens/cart_screen.dart';
import 'package:meaw/View/screens/main_screen.dart';
import 'package:meaw/View/screens/my_orders_details.dart';
import 'package:meaw/View/screens/my_orders_screen.dart';
import 'package:meaw/View/screens/payment_screen.dart';
import 'package:meaw/View/screens/welcome_screen.dart';
import 'package:meaw/logic/bindings/auth_binding.dart';
import 'package:meaw/logic/bindings/main_binding.dart';
import 'package:meaw/logic/bindings/product_binding.dart';

class AppRoutes {
  // initialRoute

  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

  //getPages

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgotPasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AuthBinding()),
    GetPage(name: Routes.mainScreen, page: () => MainScreen(), bindings: [
      AuthBinding(),
      MainBinding(),
      ProductBinding(),
    ]),
    GetPage(
        name: Routes.cartScreen,
        page: () => CartScreen(),
        bindings: [
          AuthBinding(),
          ProductBinding(),

        ]),
    GetPage(
        name: Routes.paymentScreen,
        page: () => PaymentScreen(),
        bindings: [
          AuthBinding(),
          ProductBinding(),
          MainBinding(),
        ]),
    GetPage(
        name: Routes.myOrdersScreen,
        page: () => MyOrdersScreen(),
        bindings: [
          AuthBinding(),
          ProductBinding(),
          MainBinding(),
        ]),
    GetPage(
        name: Routes.myOrdersDetailsScreen,
        page: () => MyOrdersDetailsScreen(),
        bindings: [
          AuthBinding(),
          ProductBinding(),
          MainBinding(),
        ]),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeSreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPassword';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/PaymentScreen';
  static const myOrdersScreen = '/myOrdersScreen';
  static const myOrdersDetailsScreen = '/myOrdersDetailsScreen';
}
