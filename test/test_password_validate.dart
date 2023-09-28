import 'package:nexle_testing_round/helpers/helpers.dart';
import 'package:test/test.dart';
import 'package:get_it/get_it.dart';
import 'package:nexle_testing_round/di/di.dart';
main() async{
  await configureInjection();
  group('Test Validate password', () {
    test('test password too short', () async {
      expect(GetIt.instance.get<ValidatePassword>().validate('tran').label, PasswordStrength.short().label);
    });
    test('test password weak', () async {
      expect(GetIt.instance.get<ValidatePassword>().validate('trandinhtao').label, PasswordStrength.weak().label);
    });
    test('test password fair', () async {
      expect(GetIt.instance.get<ValidatePassword>().validate('Trandinhtao').label, PasswordStrength.fair().label);
    });
    test('test password good', () async {
      expect(GetIt.instance.get<ValidatePassword>().validate('Trandinhtao1').label, PasswordStrength.good().label);
    });
    test('test password strong', () async {
      expect(GetIt.instance.get<ValidatePassword>().validate('Trandinhtao1998@').label, PasswordStrength.strong().label);
    });
  });
}