// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get/get.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nexle_testing_round/data/mapper/auth_data_mapper.dart' as _i5;
import 'package:nexle_testing_round/data/mapper/category_data_mapper.dart'
    as _i7;
import 'package:nexle_testing_round/data/mapper/user_data_mapper.dart' as _i20;
import 'package:nexle_testing_round/data/models/auth_data.dart' as _i4;
import 'package:nexle_testing_round/data/models/category_data.dart' as _i6;
import 'package:nexle_testing_round/data/models/user_data.dart' as _i19;
import 'package:nexle_testing_round/helpers/validator_helper.dart' as _i22;
import 'package:nexle_testing_round/models/category/category.dart' as _i8;
import 'package:nexle_testing_round/models/models.dart' as _i10;
import 'package:nexle_testing_round/models/user/user.dart' as _i21;
import 'package:nexle_testing_round/navigation/router/app_router.dart' as _i3;
import 'package:nexle_testing_round/services/log_service/log_service.dart'
    as _i14;
import 'package:nexle_testing_round/services/toast_service/toast_service.dart'
    as _i15;
import 'package:nexle_testing_round/ui/components/list_option_component/option_item_mapper.dart'
    as _i9;
import 'package:nexle_testing_round/ui/screen/category_screen/controller/category_screen_controller.dart'
    as _i23;
import 'package:nexle_testing_round/ui/screen/sign_up_screen/controller/sign_up_screen_controller.dart'
    as _i24;
import 'package:nexle_testing_round/use_cases/get_list_category_from_local_use_case.dart'
    as _i12;
import 'package:nexle_testing_round/use_cases/get_list_category_use_case.dart'
    as _i13;
import 'package:nexle_testing_round/use_cases/save_list_category_use_case.dart'
    as _i16;
import 'package:nexle_testing_round/use_cases/sign_in_use_case.dart' as _i17;
import 'package:nexle_testing_round/use_cases/sign_up_use_case.dart' as _i18;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.factoryParam<_i4.AuthData, Map<String, dynamic>, dynamic>((
      json,
      _,
    ) =>
        _i4.AuthData.fromJson(json));
    gh.lazySingleton<_i5.AuthDataMapper>(() => _i5.AuthDataMapper());
    gh.factoryParam<_i6.CategoryData, Map<String, dynamic>, dynamic>((
      json,
      _,
    ) =>
        _i6.CategoryData.fromJson(json));
    gh.lazySingleton<_i7.CategoryDataMapper>(() => _i7.CategoryDataMapper());
    gh.factoryParam<_i8.CategoryModel, Map<String, dynamic>, dynamic>((
      json,
      _,
    ) =>
        _i8.CategoryModel.fromJson(json));
    gh.factoryParam<_i9.CategoryOptionMapper, _i10.CategoryModel, _i11.RxBool>((
      model,
      selected,
    ) =>
        _i9.CategoryOptionMapper(
          model: model,
          selected: selected,
        ));
    gh.lazySingleton<_i12.GetListCategoryFromLocalUseCase>(
        () => _i12.GetListCategoryFromLocalUseCase());
    gh.lazySingleton<_i13.GetListCategoryUseCase>(
        () => _i13.GetListCategoryUseCase());
    gh.lazySingleton<_i14.LogService>(() => _i14.LogService());
    gh.singleton<_i15.MyToastService>(_i15.MyToastService());
    gh.lazySingleton<_i16.SaveListCategoryUseCase>(
        () => _i16.SaveListCategoryUseCase());
    gh.lazySingleton<_i17.SignInUseCase>(() => _i17.SignInUseCase());
    gh.lazySingleton<_i18.SingUpUseCase>(() => _i18.SingUpUseCase());
    gh.factoryParam<_i19.UserData, Map<String, dynamic>, dynamic>((
      json,
      _,
    ) =>
        _i19.UserData.fromJson(json));
    gh.lazySingleton<_i20.UserDataMapper>(() => _i20.UserDataMapper());
    gh.factoryParam<_i21.UserModel, Map<String, dynamic>, dynamic>((
      json,
      _,
    ) =>
        _i21.UserModel.fromJson(json));
    gh.lazySingleton<_i22.ValidatePassword>(() => _i22.ValidatePassword());
    gh.lazySingleton<_i22.ValidatorEmail>(() => _i22.ValidatorEmail());
    gh.lazySingleton<_i23.CategoryScreenController>(
        () => _i23.CategoryScreenController(
              gh<_i13.GetListCategoryUseCase>(),
              gh<_i16.SaveListCategoryUseCase>(),
              gh<_i12.GetListCategoryFromLocalUseCase>(),
            ));
    gh.lazySingleton<_i24.SignUpScreenController>(
        () => _i24.SignUpScreenController(
              gh<_i17.SignInUseCase>(),
              gh<_i18.SingUpUseCase>(),
            ));
    return this;
  }
}
