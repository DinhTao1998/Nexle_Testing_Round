import 'dart:convert';

import 'package:nexle_testing_round/models/models.dart';
import 'package:nexle_testing_round/services/client_service/client_service.dart';
import 'package:nexle_testing_round/services/services.dart';

class AuthService{
  const AuthService._(this._authModel);
  final AuthModel _authModel;
  static AuthService ? _authService;
  static AuthService get instance => _authService!;
  static Future setAuth(AuthModel auth) async{
    _authService = AuthService._(auth);
    ClientService.instance.setAuth = {'Authorization':'Bearer ${_authService?.accessToken()??''}'};
    await LocalStorageService.instance.setValue('auth',jsonEncode(auth.toJson()));
    String ?_auth = await LocalStorageService.instance.getValue('auth');
    print(_auth);
  }

  deleteAuth(){
    if(checkAuth()){
      ClientService.instance.setAuth = null;
      _authService = null;
    }
  }

  static bool checkAuth(){
    try {
      return _authService != null;
    }catch(e){
      return false;
    }
  }

  UserModel? getUser(){
    if(checkAuth()) return  _authModel.user;
    return null;
  }

  String? accessToken(){
    if(checkAuth()) return  _authModel.accessToken;
    return null;
  }

  String? refreshToken(){
    if(checkAuth()) return  _authModel.refreshToken;
    return null;
  }
}