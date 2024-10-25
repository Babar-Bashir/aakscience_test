import 'package:aak_tele_science/core/entities/user.dart';
import 'package:aak_tele_science/core/entities/user_type_enum.dart';
import 'package:aak_tele_science/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailAndPassword(
      {required String firstName,
      required String lastName,
      required UserType userType,
      required String userName,
      required String email,
      required String password,
      required String country});
  Future<Either<Failure, User>> signInWithEmailAndPassword(
      {required String email, required String password});
}
