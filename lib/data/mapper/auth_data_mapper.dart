import 'package:get_it/get_it.dart';
import 'package:nexle_testing_round/data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:nexle_testing_round/data/mapper/user_data_mapper.dart';
import 'package:nexle_testing_round/data/models/user_data.dart';
import 'package:nexle_testing_round/models/models.dart';
@lazySingleton
class AuthDataMapper extends BaseDataMapper<AuthData,AuthModel>{
  const AuthDataMapper();

  @override
  AuthModel mapToEntity(AuthData? data) {
    return AuthModel(
      accessToken: data?.accessToken??'',
      refreshToken: data?.refreshToken??'',
      user: GetIt.instance.get<UserDataMapper>().mapToEntity(data?.user)
    );
  }
}