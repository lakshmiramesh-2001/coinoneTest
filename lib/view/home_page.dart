import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_imagelist/constance/app_colors.dart';
import 'package:task_imagelist/firebase/firebase_auth.dart';
import 'package:task_imagelist/routers/routers.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
   final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page',style: TextStyle(color: AppColors.blackColor),),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _authService.signOut();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (homeController.categories.isEmpty) {
          return Center(child: Text('No categories found'));
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75),
            itemCount: homeController.categories.length,
            itemBuilder: (context, index) {
              final category = homeController.categories[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DETAIL, arguments: category.id);
                },
                child: Card(
                  color: AppColors.blackColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
                          child: Image.network(
                            'https://coinoneglobal.in/crm/${category.imgUrlPath}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          category.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: AppColors.whiteColor),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
