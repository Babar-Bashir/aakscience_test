import 'package:aak_tele_science/core/entities/user.dart';
import 'package:aak_tele_science/core/entities/user_type_enum.dart';
import 'package:aak_tele_science/core/errors/failure.dart';
import 'package:aak_tele_science/core/exceptions/server_exception.dart';
import 'package:aak_tele_science/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:aak_tele_science/features/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(() async =>
        await authRemoteDataSource.signInWithEmailAndPassword(email, password));
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword(
      {required String firstName,
      required String lastName,
      required UserType userType,
      required String userName,
      required String email,
      required String password,
      required String country}) async {
    return _getUser(() async =>
        await authRemoteDataSource.signUpWithEmailAndPassword(
            firstName, lastName, userType, userName, email, password, country));
  }

  Future<Either<Failure, User>> _getUser(Function() fn) async {
    try {
      return Right(await fn());
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    } on DioException catch (e) {
      return Left(Failure(e.response?.data ?? "Unknow Error"));
    }
  }
}
