import 'package:get/get.dart';
import 'package:meaw/languages/ar.dart';
import 'package:meaw/languages/fr.dart';
import 'package:meaw/utils/my_string.dart';
import 'en.dart';
class LocalizationApp extends Translations{
  @override
  Map<String, Map<String, String>> get keys =>{
    ene : en,
    ara : ar,
    frf : fr
  };
}