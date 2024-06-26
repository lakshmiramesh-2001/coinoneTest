import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:task_imagelist/constance/app_colors.dart';
import 'package:task_imagelist/controllers/signin_controller.dart';
import 'package:task_imagelist/view/signup_page.dart';
import 'package:task_imagelist/widgets/elevatedButton_widget.dart';
import 'package:task_imagelist/widgets/textfield_widget.dart';

class SignInPage extends StatelessWidget {
  final SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Lottie.asset(
                'lib/assets/Animation - 1719405441136.json',
              ),
              TextFieldWidget(
                controller: _signInController.emailController,
                labelText: 'Email',
                icon: Icons.email,
              ),
              SizedBox(height: 20),
              Obx(() => TextFieldWidget(
                obscureText: _signInController.isPasswordObscured.value,
                trailingIcon: _signInController.isPasswordObscured.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                toggleObscureText: _signInController.togglePasswordVisibility,
                controller: _signInController.passwordController,
                labelText: 'Password',
                icon: Icons.lock,
              )),
              SizedBox(height: 20),
              ElevatedButtonWidget(
                text: 'Sign In',
                onPressed: () => _signInController.signIn(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New around here?'),
                  TextButton(
                    onPressed: () => Get.to(SignUpPage()),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
