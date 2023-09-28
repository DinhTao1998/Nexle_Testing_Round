import 'package:dio/dio.dart';
import 'package:nexle_testing_round/models/models.dart';
import 'package:get_it/get_it.dart';
import 'package:nexle_testing_round/services/services.dart';
import 'package:nexle_testing_round/data/data.dart';
import 'package:nexle_testing_round/use_cases/get_list_category_use_case.dart';
import 'package:nexle_testing_round/use_cases/sign_in_use_case.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nexle_testing_round/di/di.dart';
class MockDio extends Mock implements AppApiService {}
main() async{
  await configureInjection();
  SignInUseCase signInUseCase = GetIt.instance.get<SignInUseCase>();
  setUp(() {
    ClientService.init();
    AppApiService.getInstance();
  });
  group('Test use case sign in', () {
    test('sign in use case successfully', () async {
      SignInUseCaseOutput output = await signInUseCase.execute(const SignInUseCaseInput(SignInFormData(email: 'taotd@gmail.com', password: '123456',)));
      expect(output.result,true);
    });
    test('sign in use case failure', () async {
      SignInUseCaseOutput output = await signInUseCase.execute(const SignInUseCaseInput(SignInFormData(email: 'totd@gmail.com', password: '123456',)));
      expect(output.result,false);
    });
  });
}