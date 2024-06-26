import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task_imagelist/view/detail_page.dart';
import 'package:task_imagelist/view/home_page.dart';
import 'package:task_imagelist/view/signin_page.dart';
import 'package:task_imagelist/view/signup_page.dart';

import 'package:task_imagelist/view/welcome_page.dart';

class Routes {
  static const SIGININ = '/siginin';
  static const SIGINUP = '/signup';
  static const HOME = '/home';
  static const DETAIL = '/detail';
  static const WELCOME = '/welcome';
}
class AppPages {
  static final pages = [
    GetPage(name: Routes.SIGININ, page: () => SignInPage()),
    GetPage(name: Routes.SIGINUP, page: () => SignUpPage()),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.DETAIL, page: () => DetailPage()),
    GetPage(name: Routes.WELCOME, page: () => WelcomPage()),
  ];
}