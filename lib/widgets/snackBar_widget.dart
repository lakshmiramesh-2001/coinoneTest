import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_imagelist/constance/app_colors.dart';

class SnackbarWidget {
  static void showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.blackColor,
      colorText: AppColors.whiteColor,
      duration: Duration(seconds: 3),
    );
  }
}