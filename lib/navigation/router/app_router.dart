import 'package:injectable/injectable.dart';
import 'package:get/get.dart';
import 'package:nexle_testing_round/navigation/middleware.dart';
import 'package:nexle_testing_round/ui/screen/category_screen/category_screen.dart';
import 'package:nexle_testing_round/ui/screen/category_screen/controller/category_screen_controller.dart';
import 'package:nexle_testing_round/ui/screen/sign_up_screen/controller/sign_up_screen_controller.dart';
import 'package:nexle_testing_round/ui/screen/sign_up_screen/sign_up_screen.dart';
@LazySingleton()
class AppRouter{
  AppRouter();

  static const String SIGNUP_SCREEN = '/signup';
  static const String CATEGORY_SCREEN = '/category';

  final List<GetPage> _router = [
    GetPage(
      name: SIGNUP_SCREEN,
      page: () => const  SignUpScreen(),
      binding: SignUpScreenControllerBinding(),
      middlewares: [
        GlobalMiddleware()
      ]
    ),
    GetPage(
      name: CATEGORY_SCREEN,
      page: () => const CategoryScreen(),
      binding: CategoryScreenControllerBinding(),
      middlewares: [
        GlobalMiddleware()
      ]
    )
  ];

  List<GetPage> get router => _router;

  String get initRoute => SIGNUP_SCREEN;
}
