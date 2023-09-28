abstract class BaseFormDataModel{
  const BaseFormDataModel();
  Map<String, dynamic> toJson();
}

class SignUpFormData extends BaseFormDataModel{
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  const SignUpFormData({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['lastName'] = lastName;
    data['firstName'] = firstName;
    return data;
  }
}

class SignInFormData extends BaseFormDataModel{
  final String email;
  final String password;

  const SignInFormData({
    required this.email,
    required this.password,
    });

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}