import 'package:get_it/get_it.dart';
import 'package:nexle_testing_round/data/mapper/user_data_mapper.dart';
import 'package:nexle_testing_round/data/models/user_data.dart';
import 'package:nexle_testing_round/models/models.dart';
import 'package:injectable/injectable.dart';
class AuthModel {
  String? accessToken;
  String? refreshToken;
  UserModel? user;

  AuthModel({this.accessToken,this.refreshToken, this.user});

  @factoryMethod
  AuthModel.fromJson(@factoryParam Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken= json['refreshToken'];
    user = GetIt.instance.get<UserDataMapper>().mapToEntity(UserData.fromJson(json));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['user'] = user?.toJson();
    return data;
  }
}