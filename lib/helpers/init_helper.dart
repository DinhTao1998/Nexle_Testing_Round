import 'package:nexle_testing_round/di/di.dart';
import 'package:nexle_testing_round/services/services.dart';
class InitHelper{
  const InitHelper._();
  static Future initApp() async{
    //init api service
    ClientService.init();
    // init LocalStorage
    await LocalStorageService.init();
    // LocalStorageService.instance.clearAll();
    //init get_it
    await configureInjection();

  }
}