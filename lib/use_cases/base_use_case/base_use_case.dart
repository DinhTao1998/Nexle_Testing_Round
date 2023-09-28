import 'package:flutter/cupertino.dart';

abstract class BaseUseCase<Input extends BaseUseCaseInput, Output extends BaseUseCaseOutput>{
  @protected
  Future<Output> buildUseCase(Input ?input);

  Future<Output> execute([Input ?input]) async {
    try {
      final Output output = await buildUseCase(input);
      return output;
    } catch (e) {
      rethrow;
    }
  }
}

abstract class BaseUseCaseInput{
  const BaseUseCaseInput();
}
abstract class BaseUseCaseOutput{
  const BaseUseCaseOutput();
}