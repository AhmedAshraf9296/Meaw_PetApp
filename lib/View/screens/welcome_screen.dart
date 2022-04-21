import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meaw/View/widgets/text_utils.dart';
import 'package:meaw/View/widgets/theme.dart';
import 'package:meaw/routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              // width: double.infinity,
              // height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/mainphoto.jpg',
                  ),
                  fit: BoxFit.cover,
                )
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 80),
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black.withOpacity(0.4)),
                    child: const Center(
                        child: TextUtils('Welcome', 35, FontWeight.bold,
                            Colors.white, TextDecoration.none)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*.07,
                    width: MediaQuery.of(context).size.width*.56,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black.withOpacity(0.4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils("Meaaw", MediaQuery.of(context).size.width*.09, FontWeight.bold, mainColor,
                            TextDecoration.none),
                        const SizedBox(
                          width: 10,
                        ),
                        TextUtils("Pet Food",  MediaQuery.of(context).size.width*.07, FontWeight.bold, Colors.white,
                            TextDecoration.none)
                      ],
                    ),
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height*.2,
                    // height: 250,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12)),
                    onPressed: () {Get.toNamed(Routes.loginScreen);},
                    child: const TextUtils("Get Start", 22, FontWeight.bold,
                        Colors.white, TextDecoration.none),
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height*.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextUtils("Don't have an Account ?", 22,
                          FontWeight.bold, Colors.white, TextDecoration.none),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.signUpScreen);
                        },
                        child: const TextUtils("Sign Up", 18, FontWeight.normal,
                            Colors.white, TextDecoration.underline),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
