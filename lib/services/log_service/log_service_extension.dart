import 'package:flutter/cupertino.dart';
import 'package:nexle_testing_round/services/services.dart';
import 'package:nexle_testing_round/helpers/helpers.dart';
import 'package:get_it/get_it.dart';
class LogServiceWithToast extends LogService{
  const LogServiceWithToast({required this.context});
  final BuildContext context;
  @override
  T writeLog<T extends BaseException>(BaseException exception){
    GetIt.instance.get<MyToastService>().of(context).showToast(exception);
    return super.writeLog(exception);
  }
}

class LogServiceWithErrorAction extends LogService{
  const LogServiceWithErrorAction({required this.onError});
  final void Function(BaseException exception) onError;
  @override
  T writeLog<T extends BaseException>(BaseException exception){
    onError(exception);
    return super.writeLog(exception);
  }
}