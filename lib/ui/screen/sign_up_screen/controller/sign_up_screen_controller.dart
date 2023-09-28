import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:nexle_testing_round/helpers/helpers.dart';
import 'package:get_it/get_it.dart';
import 'package:nexle_testing_round/models/models.dart';
import 'package:nexle_testing_round/navigation/navigation.dart';
import 'package:nexle_testing_round/services/auth_service/auth_service.dart';
import 'package:nexle_testing_round/use_cases/sign_in_use_case.dart';
import 'package:nexle_testing_round/use_cases/sign_up_use_case.dart';
@LazySingleton()
class SignUpScreenController extends GetxController{

  final SingUpUseCase _singUpUseCase;
  final SignInUseCase _signInUseCase;
  SignUpScreenController(this._signInUseCase,this._singUpUseCase);

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final RxBool validate = false.obs;
  final Rx<PasswordStrength> passwordStrength = PasswordStrength.init().obs;
  final RxBool validateAge = false.obs;
  final RxBool screenLoading = false.obs;

  @override
  void onInit() {
    email.addListener(_checkHasData);
    password.addListener(_checkHasData);
    super.onInit();
  }

  _checkHasData() {
    if(passwordFocus.hasFocus) {
      passwordStrength.value =
          GetIt.instance.get<ValidatePassword>().validate(password.text);
    }
    String ? validateEmail = GetIt.instance.get<ValidatorEmail>().validate(email.text);
    if (validateEmail == null && passwordStrength.value.validate && validateAge.value) {
      validate.value = true;
    } else{
      validate.value = false;
    }
  }

  @override
  void onClose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }

  void actionCheckBox(bool? value){
    if(value != null) {
      validateAge.value = value;
    }
    _checkHasData();
  }

  void unFocusController(){
    emailFocus.unfocus();
    passwordFocus.unfocus();
    _checkHasData();
  }

  Future pressSignUpButton() async{
    screenLoading.value = true;
    SignUpFormData formData = SignUpFormData(
        email: email.text,
        password: password.text,
        firstName: 'Tao',
        lastName: 'Tran Dinh'
    );
    SingUpUseCaseOutput caseOutput = await _singUpUseCase.execute(SingUpUseCaseInput(formData));
    if(caseOutput.result){
      _loginAction();
    }else{
      screenLoading.value = false;
      Get.snackbar('SingUp failure', caseOutput.message,backgroundColor: Colors.red);
    }
  }
  
  Future _loginAction()async{
    SignInFormData formData = SignInFormData(
        email: email.text,
        password: password.text,
    );
    SignInUseCaseOutput caseOutput = await _signInUseCase.execute(SignInUseCaseInput(formData));
    screenLoading.value = false;
    if(caseOutput.result){
      await AuthService.setAuth(caseOutput.authModel!);
      Get.offAllNamed(AppRouter.CATEGORY_SCREEN);
    }else{
      Get.snackbar('SingIn failure', caseOutput.message,backgroundColor: Colors.red);
    }
  }
}


class SignUpScreenControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => GetIt.instance.get<SignUpScreenController>());
  }
}