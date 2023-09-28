import 'package:nexle_testing_round/data/data.dart';
import 'package:nexle_testing_round/helpers/helpers.dart';
import 'package:test/test.dart';
import 'package:get_it/get_it.dart';
import 'package:nexle_testing_round/di/di.dart';
main() async{
  await configureInjection();
  group('Test Mapper', () {
    test('test mapper Auth Model', () async {
      Map<String,dynamic> json = {
        "user": {
          "id": 2,
          "createdAt": "2023-06-08T04:56:01.051Z",
          "updatedAt": "2023-06-08T04:56:01.051Z",
          "email": "test1@gmail.com",
          "firstName": "Tester",
          "lastName": "Mr",
          "role": "USER"
        },
        "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIsImVtYWlsIjoidGVzdDFAZ21haWwuY29tIiwiaWF0IjoxNjg2MjAwMTk3LCJleHAiOjE2ODYyOTAxOTd9.a-TQ0MNNwNTczUqcxsDB9Zi748NtrCEgAtgPL98QsEE",
        "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIsImVtYWlsIjoidGVzdDFAZ21haWwuY29tIiwiaWF0IjoxNjg2MjAwMTk3LCJleHAiOjE2ODY0NTkzOTd9.BsfOo9lqMXIpBE-7b1mAsxo1az5efpaqK0BWKpYQXoc"
      };
      var data = BaseSuccessResponseMapper<AuthData,DataResponse<AuthData>>.fromType(SuccessResponseMapperType.object).map(json);
      expect(data, isA<DataResponse<AuthData>>());
    });
  });
}