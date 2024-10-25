import 'package:aak_tele_science/core/entities/user.dart';
import 'package:aak_tele_science/core/entities/user_type_enum.dart';
import 'package:aak_tele_science/core/errors/failure.dart';
import 'package:aak_tele_science/core/usecase/usercase.dart';
import 'package:aak_tele_science/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  AuthRepository authRepository;
  UserSignUp({required this.authRepository});
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
        firstName: params.firstName,
        lastName: params.lastName,
        userType: params.userType,
        userName: params.userName,
        email: params.email,
        password: params.password,
        country: params.country);
  }
}

class UserSignUpParams {
  final String firstName;
  final String lastName;
  final UserType userType;
  final String userName;
  final String email;
  final String password;
  final String country;
  UserSignUpParams(
      {required this.firstName,
      required this.lastName,
      required this.userType,
      required this.userName,
      required this.email,
      required this.password,
      required this.country});
}
