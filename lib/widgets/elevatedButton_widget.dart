import 'package:flutter/material.dart';
import 'package:task_imagelist/constance/app_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;

  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 50.0,
    this.width = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: AppColors.whiteColor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
