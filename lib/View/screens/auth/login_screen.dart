import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meaw/View/widgets/auth/auth_button.dart';
import 'package:meaw/View/widgets/auth/auth_text_form_field.dart';
import 'package:meaw/View/widgets/auth/container_under.dart';
import 'package:meaw/View/widgets/text_utils.dart';
import 'package:meaw/logic/Controller/auth_controller.dart';
import 'package:meaw/routes/routes.dart';
import 'package:meaw/utils/my_string.dart';

import '../../widgets/theme.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Get.isDarkMode ? Colors.white : Colors.grey.shade900,
        //   elevation: 0,
        // ),
        // backgroundColor: Get.isDarkMode ? Colors.white : Colors.grey.shade900,
        backgroundColor: secondalymainColor,
        body: Container(
          decoration:
          const BoxDecoration(
            // image: DecorationImage(
            //   image:AssetImage(
            //     'assets/images/mainphoto1.jpg',
            //   ),
            //   fit: BoxFit.cover
            // ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.13,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextUtils(
                                "LOG",
                                30,
                                FontWeight.bold,
                                Get.isDarkMode ? secondalymainColor : mainColor,
                                TextDecoration.none,
                              ),
                               SizedBox(
                                width: MediaQuery.of(context).size.height*.01,
                              ),
                              TextUtils(
                                "IN",
                                28,
                                FontWeight.w500,
                                Get.isDarkMode ? Colors.black : Colors.white,
                                TextDecoration.none,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*.03,
                          ),
                          AuthTextFormField(emailController, false, (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return "Enter Valid Email";
                            } else {
                              return null;
                            }
                          },
                              Get.isDarkMode
                                  ? Image.asset(
                                      "assets/images/email.png",
                                      color: Colors.purple.withOpacity(.70),
                                    )
                                  : const Icon(
                                      Icons.email,
                                      size: 30,
                                      color: mainColor,
                                    ),
                              const Text(""),
                              "Email"),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .03,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return AuthTextFormField(passwordController,
                                controller.isVisibilty ? false : true, (value) {
                              if (value.toString().length < 6) {
                                return "Password should be longer than or equal to 6 characters";
                              } else {
                                return null;
                              }
                            },
                                Get.isDarkMode
                                    ? Image.asset(
                                        "assets/images/lock.png",
                                        color: Colors.purple.withOpacity(.70),
                                      )
                                    : const Icon(
                                        Icons.lock,
                                        size: 30,
                                        color: mainColor,
                                      ),
                                IconButton(
                                  onPressed: () {
                                    controller.visibility();
                                  },
                                  icon: controller.isVisibilty
                                      ? const Icon(
                                          Icons.visibility_off,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        ),
                                ),
                                "Password");
                          }),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgotPasswordScreen);
                              },
                              child: TextUtils(
                                  "Forgot Password ?",
                                  14,
                                  FontWeight.normal,
                                  Get.isDarkMode ? Colors.black : Colors.white,
                                  TextDecoration.none),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return AuthButton("LOG IN", () {
                              if (formKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.logInUsingFirebase(
                                    email: email, password: password);
                              }
                            });
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          TextUtils(
                            "OR",
                            18,
                            FontWeight.w500,
                            Get.isDarkMode ? Colors.black : Colors.white,
                            TextDecoration.none,
                          ),
                           SizedBox(
                            height: MediaQuery.of(context).size.height*.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GetBuilder<AuthController>(builder: (_) {
                                return InkWell(
                                  onTap: () {
                                    controller.googleSignUpUsingFirebase();
                                  },
                                  child: Image.asset(
                                    "assets/images/google.png",
                                  ),
                                );
                              }),
                              const SizedBox(
                                width: 20,
                              ),
                              GetBuilder<AuthController>(builder: (_) {
                                return InkWell(
                                  onTap: () {
                                    controller.facebookSignUpUsingFirebase();
                                  },
                                  child: Image.asset(
                                    "assets/images/facebook.png",
                                  ),
                                );
                              })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ContainerUnder("Don't have an account ?  ", "SIGN UP", () {
                  Get.offNamed(Routes.signUpScreen);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
