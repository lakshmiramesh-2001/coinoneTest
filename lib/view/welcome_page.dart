import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:task_imagelist/view/signin_page.dart';
import 'package:task_imagelist/view/signup_page.dart';
import 'package:task_imagelist/widgets/elevatedButton_widget.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset('lib/assets/Animation - 1719396166767.json'),
          SizedBox(
            height: 20,
          ),
          ElevatedButtonWidget(
            text: "SIGIN",
            onPressed: () => Get.to(SignInPage()),
          ),
           SizedBox(
            height: 10,
          ),
          ElevatedButtonWidget(
            text: "SIGUP",
            onPressed: () => Get.to(SignUpPage()),
          ),
        ],
      )),
    );
  }
}
