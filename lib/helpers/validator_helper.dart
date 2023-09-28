import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nexle_testing_round/resources/resources.dart';
abstract class Validator<T>{
  T? validate(String value);
}

@lazySingleton
class ValidatorEmail implements Validator<String>{
  @override
  String? validate(String value) {
    RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (value.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Enter a correct email';
    }
    return null;
  }

}

@lazySingleton
class ValidatePassword implements Validator<PasswordStrength>{
  static List<RegExp> listRegExp = [
    RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+"),
    RegExp(r"[0-9]"),
    RegExp(r"[!@#$&()\-`.+,/]")
  ];

  static List<PasswordStrength> listValidate = [
    PasswordStrength.short(),
    PasswordStrength.weak(),
    PasswordStrength.fair(),
    PasswordStrength.good(),
    PasswordStrength.strong(),
  ];

  @override
  PasswordStrength validate(String value){
    PasswordStrength strength = PasswordStrength.weak();
    int level = 0;
    for(RegExp regex in listRegExp){
      if(_validate(value, strength,regex) == 1){
        level++;
      }
      if(_validate(value, strength,regex) == -1){
        strength = PasswordStrength.short();
        break;
      }
    }
    if(level > 0){
      strength = listValidate.firstWhere((element) => element.level == level);
    }
    return strength;
  }

  static int  _validate(String password,PasswordStrength type, RegExp regExp){

    if(password.length < type.minCharacter || password.length > type.maxCharacter) return -1;

    if(regExp.hasMatch(password)) return 1;

    return 0;
  }
}

class PasswordStrength{
  const PasswordStrength._({
    required this.maxCharacter,
    required this.value,
    required this.index,
    required this.minCharacter,
    required this.level,
    required this.label,
    required this.color,
    required this.validate
  });
  final int minCharacter;
  final int maxCharacter;
  final int level;
  final String label;
  final Color color;
  final double value;
  final int index;
  final bool validate;

  factory PasswordStrength.init(){
    return PasswordStrength._(
        validate: false,
        minCharacter: 0,
        maxCharacter: 0,
        value: 100,
        index: -1,
        level: -1,
        label: '',
        color: AppColors.current.secondaryColor
    );
  }

  factory PasswordStrength.short(){
    return PasswordStrength._(
        validate: false,
        minCharacter: 0,
        maxCharacter: 5,
        value: 100,
        index: 0,
        level: 0,
        label: 'Too short',
        color: Colors.white.withOpacity(0.5)
    );
  }

  factory PasswordStrength.weak(){
    return const PasswordStrength._(
        validate:  true,
        minCharacter: 6,
        maxCharacter: 18,
        value: 0.25,
        index: 1,
        level: 0,
        label: 'Weak',
        color: Color(0xFFE05151)
    );
  }
  factory PasswordStrength.fair(){
    return const PasswordStrength._(
        validate:  true,
        minCharacter: 6,
        maxCharacter: 18,
        value: 0.50,
        index: 2,
        level: 1,
        label: 'Fair',
        color: Color(0xFFE3A063)
    );
  }

  factory PasswordStrength.good(){
    return const PasswordStrength._(
        validate: true,
        minCharacter: 6,
        maxCharacter: 18,
        value: 0.75,
        index: 3,
        level: 2,
        label: 'Good',
        color: Color(0xFF647FFF)
    );
  }

  factory PasswordStrength.strong(){
    return const PasswordStrength._(
        validate: true,
        minCharacter: 6,
        maxCharacter: 18,
        value: 1,
        index: 4,
        level: 3,
        label: 'Strong',
        color: Color(0xFF91E2B7)
    );
  }
}
