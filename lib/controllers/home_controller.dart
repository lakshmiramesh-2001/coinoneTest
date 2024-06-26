import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:task_imagelist/models/templete_category.dart';


class HomeController extends GetxController {
  var isLoading = true.obs;
  var categories = <TemplateCategory>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateCategoryList?PrmCmpId=1&PrmBrId=2'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        categories.value = (jsonData as List).map((i) => TemplateCategory.fromJson(i)).toList();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
