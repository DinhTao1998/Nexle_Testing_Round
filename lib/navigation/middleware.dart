import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nexle_testing_round/navigation/navigation.dart';
import 'package:nexle_testing_round/services/auth_service/auth_service.dart';

class GlobalMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String ?route) {
    return AuthService.checkAuth() || route == AppRouter.SIGNUP_SCREEN
        ? null
        : const RouteSettings(name: AppRouter.SIGNUP_SCREEN);
  }
}