import 'package:aak_tele_science/core/entities/login.dart';
import 'package:aak_tele_science/core/entities/user.dart';
import 'package:aak_tele_science/core/errors/failure.dart';
import 'package:aak_tele_science/core/usecase/usercase.dart';
import 'package:aak_tele_science/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogin implements UseCase<Login, UserLoginParams> {
  AuthRepository authRepository;
  UserLogin({required this.authRepository});
  @override
  Future<Either<Failure, Login>> call(UserLoginParams params) async {
    return await authRepository.signInWithEmailAndPassword(
        email: params.email, password: params.password);
  }
}

class UserLoginParams {
  final String email;
  final String password;
  UserLoginParams({required this.email, required this.password});
}
