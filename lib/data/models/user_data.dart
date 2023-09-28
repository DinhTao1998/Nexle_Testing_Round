import 'package:injectable/injectable.dart';
@injectable
class UserData{
  UserData._();
  int? id;
  String? email;
  String? password;
  String? lastName;
  String? firstName;
  String? createdAt;
  String? updatedAt;
  String? role;
  @factoryMethod
  UserData.fromJson(@factoryParam Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password =  json['password'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    role = json['role'];
  }
}