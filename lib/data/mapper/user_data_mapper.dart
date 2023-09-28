import 'package:nexle_testing_round/data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:nexle_testing_round/data/models/user_data.dart';
import 'package:nexle_testing_round/models/models.dart';
@lazySingleton
class UserDataMapper extends BaseDataMapper<UserData,UserModel>{
  const UserDataMapper();

  @override
  UserModel mapToEntity(UserData? data) {
    return UserModel(
      id: data?.id??-1,
      email: data?.email??'',
      password: data?.password??'',
      createdAt: data?.createdAt??'',
      updatedAt: data?.updatedAt??'',
      lastName: data?.lastName??'',
      firstName: data?.firstName??'',
      role: data?.role??'',
    );
  }
}