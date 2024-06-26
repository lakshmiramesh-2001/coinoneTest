import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_imagelist/constance/app_colors.dart';
import 'package:task_imagelist/controllers/detail_controller.dart';
import 'package:task_imagelist/models/templete_sub_category.dart';

class DetailPage extends StatelessWidget {
  final DetailController detailController = Get.put(DetailController());


  @override
  Widget build(BuildContext context) {
    final String categoryId = Get.arguments;

    detailController.fetchSubCategories(categoryId);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Obx(() {
        if (detailController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (detailController.subCategories.isEmpty) {
          return Center(child: Text('No subcategories found'));
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.70),
            itemCount: detailController.subCategories.length,
            itemBuilder: (context, index) {
              final TemplateSubCategory subCategory = detailController.subCategories[index];
              return Card(
                color: AppColors.blackColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
                        child: Image.network(
                          'https://coinoneglobal.in/crm/${subCategory.imgUrlPath}',
                          fit: BoxFit.cover,
                          ))),
                          Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          subCategory.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: AppColors.whiteColor),
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}