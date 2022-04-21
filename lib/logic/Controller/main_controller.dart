import 'package:get/get.dart';
import 'package:meaw/View/screens/category_screen.dart';
import 'package:meaw/View/screens/favorites_screen.dart';
import 'package:meaw/View/screens/home_screen.dart';

import '../../View/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    const HomeScreen(),
    const CategoryScreen(),
     FavoriteScreen(),
    SettingsScreen(),
  ].obs;

  final title = [
    "Meaw",
    "Categories",
    "Favorites",
    "Settings"
  ].obs;
}
