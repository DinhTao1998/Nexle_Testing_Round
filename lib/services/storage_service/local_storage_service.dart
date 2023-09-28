import 'package:nexle_testing_round/services/storage_service/storage_service.dart';
import 'package:prefs/prefs.dart';
class LocalStorageService extends StorageService{
  static LocalStorageService ?_localStorageService;
  LocalStorageService._();

  static bool get isInit => _localStorageService!= null;

  static LocalStorageService get instance => _localStorageService!;

  static late SharedPreferences _pref;

  static Future init() async {
    if(!isInit){
      _localStorageService = LocalStorageService._();
      await instance._getInstanceStorage();
    }
  }

  Future _getInstanceStorage() async {
    _pref = await SharedPreferences.getInstance();
  }

  @override
  Future clearAll() async {
   try{
     await _pref.clear();
   }catch(e){
     print(e.toString());
   }
  }

  @override
  Future<String?> getValue(String name) async{
    try{
      return _pref.getString(name);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  @override
  Future removeValue(String name) async{
    try{
      await _pref.remove(name);
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Future setValue(String name, String value)async {
    try{
      await _pref.setString(name,value);
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Future setValues(dynamic values) async{
    try{
      (values as Map<String,String>).forEach((key, value) async{
        await setValue(key, value);
      });
    }catch(e){
      print(e.toString());
    }
  }

}