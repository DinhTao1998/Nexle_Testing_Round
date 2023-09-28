import 'package:flutter/material.dart';
import 'package:nexle_testing_round/helpers/helpers.dart';
import 'package:injectable/injectable.dart';
@Singleton()
class MyToastService{
  BuildContext  ?_context;
  void showToast(BaseException exception,){
    SnackBar snackBar = SnackBar(
      content: Text(exception.getError()),
    );
    ScaffoldMessenger.of(_context!).showSnackBar(snackBar);
  }

  MyToastService of(BuildContext context){
    _context = context;
    return this;
  }
}