import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meaw/View/widgets/theme.dart';
import 'package:meaw/languages/localization.dart';
import 'package:meaw/logic/Controller/theme_controller.dart';
import 'package:meaw/routes/routes.dart';
import 'package:meaw/utils/my_string.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  // print('background message ${message.notification!.body}');
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize('resource://drawable/ic_launcher',
      // 'assets/images/logo',
      [
        // notification icon
        NotificationChannel(
          channelGroupKey: 'basic_test',
          channelKey: 'basic',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          channelShowBadge: true,
          importance: NotificationImportance.High,
          enableVibration: true,
        ),
        NotificationChannel(
            channelGroupKey: 'image_test',
            channelKey: 'image',
            channelName: 'image notifications',
            channelDescription: 'Notification channel for image tests',
            defaultColor: Colors.redAccent,
            ledColor: Colors.white,
            channelShowBadge: true,
            importance: NotificationImportance.High)
        //add more notification type with different configuration
      ]);
  await GetStorage.init();
  await Firebase.initializeApp();
  // to open the app in web
  //     options: const FirebaseOptions(
  //       apiKey: "XXX", // Your apiKey
  //       appId: "XXX", // Your appId
  //       messagingSenderId: "XXX", // Your messagingSenderId
  //       projectId: "XXX", // Your projectId
  // );

  FirebaseMessaging.onBackgroundMessage(_messageHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: GetMaterialApp(
          builder: (context, widget) => ResponsiveWrapper.builder(
                BouncingScrollWrapper.builder(context, widget!),
                maxWidth: 1200,
                minWidth: 450,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(450, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                  const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                  const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                ],
              ),
          title: 'Kanzallo Shop',
          debugShowCheckedModeBanner: false,
          theme: ThemesApp.light,
          darkTheme: ThemesApp.dark,
          themeMode: ThemeController().themeDataGet,
          locale: Locale(GetStorage().read<String>('lang').toString()),
          fallbackLocale: Locale(ene),
          translations: LocalizationApp(),
          initialRoute:
          FirebaseAuth.instance.currentUser != null ||
                  GetStorage().read<bool>('auth') == true
              ? Routes.mainScreen
              : Routes.welcomeScreen,
          getPages: AppRoutes.routes),
    );
  }
}
