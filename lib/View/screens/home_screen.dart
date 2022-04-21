import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meaw/View/widgets/home/card_items.dart';
import 'package:meaw/View/widgets/text_utils.dart';
import 'package:meaw/View/widgets/theme.dart';

import '../widgets/home/search_form_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // backgroundColor: Get.isDarkMode?Colors.white: Colors.grey.shade900,
          backgroundColor: secondalymainColor,
      body: Column(
        children: [
          // const SizedBox(height: 50,),
          Container(
            padding: const EdgeInsets.only(top: 30),
            width: double.infinity,
            // height: 180,
            height: MediaQuery.of(context).size.height*.24,
            decoration: const BoxDecoration(
              // color: Get.isDarkMode ? greenColor : mainColor.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  20,
                ),
                bottomRight: Radius.circular(20),
              ),
              image: DecorationImage(image: AssetImage('assets/images/mainphoto.jpg'),opacity: 0.3,fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const TextUtils("Find Your", 25, FontWeight.bold, Colors.white,
                      TextDecoration.none),
                  const SizedBox(
                    height: 5,
                  ),
                  const TextUtils("ANIMAL MEAL", 28, FontWeight.bold, Colors.white,
                      TextDecoration.none),
                  const SizedBox(
                    height: 20,
                  ),
                  SearchFormText(),

                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20,top: 30,right: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                children: [
                  TextUtils(
                    "Products",
                    30,
                    FontWeight.bold,
                    Get.isDarkMode? Colors.black:Colors.white,
                    TextDecoration.none,
                  ),
                  TextUtils(
                    "See more",
                    20,
                    FontWeight.w500,
                    Get.isDarkMode? Colors.black:Colors.white,
                    TextDecoration.none,
                  ),
                ],
              ),
            ),
          ),
           const SizedBox(height: 20,),
           CardItems(contextt: context,),
        ],
      ),
    ));
  }
}
