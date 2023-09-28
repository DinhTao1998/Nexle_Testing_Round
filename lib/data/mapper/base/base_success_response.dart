import 'package:nexle_testing_round/data/mapper/base_success_response_mapper/default_response_mapper.dart';
import 'package:nexle_testing_round/data/mapper/base_success_response_mapper/json_array_value_response_mapper.dart';

import '../base_success_response_mapper/array_object_response_mapper.dart';
import '../base_success_response_mapper/array_value_response_mapper.dart';
import '../base_success_response_mapper/json_array_object_response_mapper.dart';
import '../base_success_response_mapper/json_object_response_mapper.dart';
import '../base_success_response_mapper/object_response_mapper.dart';

abstract class BaseSuccessResponseMapper<I extends Object, O> {
  const BaseSuccessResponseMapper();

  factory BaseSuccessResponseMapper.fromType(SuccessResponseMapperType type) {
    switch (type) {
      case SuccessResponseMapperType.jsonObject:
        return JsonObjectResponseMapper<I>() as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.jsonArrayObject:
        return JsonArrayObjectResponseMapper<I>() as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.jsonArrayValue:
        return JsonArrayValueResponseMapper<I>() as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.object:
        return ObjectResponseMapper<I>() as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.arrayObject:
        return ArrayObjectResponseMapper<I>() as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.arrayValue:
        return ArrayValueResponseMapper<I>() as BaseSuccessResponseMapper<I, O>;
      case SuccessResponseMapperType.defaultType:
        return DefaultResponseMapper<I>() as BaseSuccessResponseMapper<I, O>;
    }
  }

  // ignore: avoid-dynamic
  O map(dynamic response);
}

enum SuccessResponseMapperType {
  jsonObject,jsonArrayObject,object,arrayObject,defaultType,jsonArrayValue,arrayValue
}