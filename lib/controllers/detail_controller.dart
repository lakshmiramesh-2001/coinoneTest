import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_imagelist/models/templete_sub_category.dart';
import 'dart:convert';


class DetailController extends GetxController {
  var isLoading = true.obs;
  var subCategories = <TemplateSubCategory>[].obs;

  void fetchSubCategories(String categoryId) async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateSubCategoryList?PrmCmpId=1&PrmBrId=2&PrmCategoryId=$categoryId'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        subCategories.value = (jsonData as List).map((i) => TemplateSubCategory.fromJson(i)).toList();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
