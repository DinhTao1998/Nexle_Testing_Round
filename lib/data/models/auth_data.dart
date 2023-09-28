import 'package:injectable/injectable.dart';
import 'package:nexle_testing_round/data/models/user_data.dart';
@injectable
class AuthData{
  AuthData._();
  String? accessToken;
  String? refreshToken;
  UserData? user;
  @factoryMethod
  AuthData.fromJson(@factoryParam Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    user = UserData.fromJson(json['user']);
  }
}