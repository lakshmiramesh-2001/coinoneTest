import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:task_imagelist/widgets/elevatedButton_widget.dart';
import 'package:task_imagelist/widgets/textfield_widget.dart';
import 'package:task_imagelist/controllers/signup_controller.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Lottie.asset(
                'lib/assets/Animation - 1719405441136.json',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                controller: _signUpController.emailController,
                labelText: 'Email',
                icon: Icons.email,
              ),
              SizedBox(height: 20),
              Obx(() => TextFieldWidget(
                controller: _signUpController.passwordController,
                labelText: 'Password',
                icon: Icons.lock,
                obscureText: _signUpController.isPasswordObscured.value,
                trailingIcon: _signUpController.isPasswordObscured.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                toggleObscureText: _signUpController.togglePasswordVisibility,
              )),
              SizedBox(height: 20),
              Obx(() => TextFieldWidget(
                controller: _signUpController.confirmPasswordController,
                labelText: 'Confirm Password',
                icon: Icons.lock,
                obscureText: _signUpController.isConfirmPasswordObscured.value,
                trailingIcon: _signUpController.isConfirmPasswordObscured.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                toggleObscureText: _signUpController.toggleConfirmPasswordVisibility,
              )),
              SizedBox(height: 20),
              ElevatedButtonWidget(
                text: 'Sign Up',
                onPressed: () => _signUpController.signUp(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
