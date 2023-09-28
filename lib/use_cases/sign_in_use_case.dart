import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nexle_testing_round/data/api/api_service.dart';
import 'package:nexle_testing_round/helpers/exception_helper.dart';
import 'package:nexle_testing_round/models/form/form.dart';
import 'package:nexle_testing_round/models/models.dart';
import 'package:nexle_testing_round/services/services.dart';
import 'package:nexle_testing_round/data/data.dart';
import 'base_use_case/base_use_case.dart';
@lazySingleton
class SignInUseCase extends BaseUseCase<SignInUseCaseInput,SignInUseCaseOutput> with LogMixin{
  @override
  Future<SignInUseCaseOutput> buildUseCase([SignInUseCaseInput ?input]) async {
    try{
      DataResponse<AuthData> data = await AppApiService.getInstance().signIn(formData: input!.formData);
      if(data.data != null) {
        AuthModel authModel = GetIt.instance.get<AuthDataMapper>().mapToEntity(
            data.data);
        return SignInUseCaseOutput(authModel:authModel,result: true,);
      }else{
        return const SignInUseCaseOutput(result: false,message: 'No data');
      }
    }on BaseException catch(e){
      return SignInUseCaseOutput(result: false, message: e.getError());
    }
    catch(e) {
      return SignInUseCaseOutput(result: false, message: e.toString());
    }
  }
}

class SignInUseCaseInput extends BaseUseCaseInput{
  const SignInUseCaseInput(this.formData);

  final BaseFormDataModel formData;
}
class SignInUseCaseOutput extends BaseUseCaseOutput{
  const SignInUseCaseOutput({
    this.authModel,
    required this.result,
    this.message = '',
});
  final AuthModel ?authModel;
  final bool result;
  final String message;
}