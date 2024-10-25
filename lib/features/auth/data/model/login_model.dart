import 'package:aak_tele_science/core/entities/login.dart';

class LoginModel extends Login {
  LoginModel({
    required super.refresh,
    required super.access,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    print("login-json is $json");
    return LoginModel(
      refresh: json['refresh'],
      access: json['access'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    return data;
  }
}
