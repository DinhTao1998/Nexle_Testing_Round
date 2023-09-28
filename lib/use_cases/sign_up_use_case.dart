import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nexle_testing_round/data/api/api_service.dart';
import 'package:nexle_testing_round/models/form/form.dart';
import 'package:nexle_testing_round/models/models.dart';
import 'package:nexle_testing_round/services/services.dart';
import 'package:nexle_testing_round/data/data.dart';
import '../helpers/exception_helper.dart';
import 'base_use_case/base_use_case.dart';
@lazySingleton
class SingUpUseCase extends BaseUseCase<SingUpUseCaseInput,SingUpUseCaseOutput> with LogMixin{
  @override
  Future<SingUpUseCaseOutput> buildUseCase([SingUpUseCaseInput ?input]) async {
    try{
      DataResponse<UserData> data = await AppApiService.getInstance().signUp(formData: input!.formData);
      if(data.data != null) {
        UserModel userModel = GetIt.instance.get<UserDataMapper>().mapToEntity(
            data.data);
        return SingUpUseCaseOutput(userModel:userModel,result: true,);
      }else{
        return const SingUpUseCaseOutput(result: false,message: 'No data');
      }
    }on BaseException catch(e){
      return SingUpUseCaseOutput(result: false, message: e.getError());
    }
    catch(e){
      return SingUpUseCaseOutput(result: false,message: e.toString());
    }
  }
}

class SingUpUseCaseInput extends BaseUseCaseInput{
  const SingUpUseCaseInput(this.formData);

  final BaseFormDataModel formData;
}
class SingUpUseCaseOutput extends BaseUseCaseOutput{
  const SingUpUseCaseOutput({
    this.userModel,
    required this.result,
    this.message = '',
  });
  final UserModel ?userModel;
  final bool result;
  final String message;
}