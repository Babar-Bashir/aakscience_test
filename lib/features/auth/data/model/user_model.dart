import 'package:aak_tele_science/core/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.status,
      required super.userId,
      required super.userType,
      required super.firstName,
      required super.lastName,
      required super.username,
      required super.email,
      required super.country,
      required super.userActiveStatus,
      required super.message});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      status: map['status'],
      userId: map['user_id'],
      userType: map['user_type'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      username: map['username'],
      email: map['email'],
      country: map['country'],
      userActiveStatus: map['user_active_status'],
      message: map['message'],
    );
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
  }) {
    return UserModel(
      status: status,
      userId: userId,
      userType: userType,
      firstName: firstName,
      lastName: lastName,
      username: username,
      email: email ?? this.email,
      country: country,
      userActiveStatus: userActiveStatus,
      message: message,
    );
  }
}
