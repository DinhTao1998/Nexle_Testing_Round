import 'package:nexle_testing_round/helpers/helpers.dart';
import 'package:nexle_testing_round/services/log_service/log_mixin.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class LogService with LogMixin{
  const LogService();
  T writeLog<T extends BaseException>(BaseException exception){
    print(exception.getError());
    logD(exception.getError());
    throw exception;
  }
}