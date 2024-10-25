import 'package:aak_tele_science/core/entities/user_type_enum.dart';
import 'package:aak_tele_science/core/exceptions/server_exception.dart';
import 'package:aak_tele_science/features/auth/data/model/login_model.dart';
import 'package:aak_tele_science/features/auth/data/model/user_model.dart';
import 'package:dio/dio.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailAndPassword(
      String firstName,
      String lastName,
      UserType userType,
      String userName,
      String email,
      String password,
      String country);
  Future<LoginModel> signInWithEmailAndPassword(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  Dio dioClient;
  AuthRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<LoginModel> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      Response response = await dioClient.post('/user_login/', data: {
        "username": email,
        "password": password,
      });

      print("Response: $response");
      if (response.statusCode != 200) {
        throw ServerException(response.toString());
      }
      return LoginModel.fromJson(response.data);
    } on DioException catch (e) {
      print("DioException is $e");
      throw ServerException(e.response?.data ?? "Unknow Error");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword(
      String firstName,
      String lastName,
      UserType userType,
      String userName,
      String email,
      String password,
      String country) async {
    try {
      Response response = await dioClient.post('/signup/', data: {
        "first_name": firstName,
        "last_name": lastName,
        "username": userName,
        "email": email,
        "password": password,
        "country": country,
        "user_type": userType.name
      });
      print("Response: $response");
      if (response.statusCode != 200) {
        throw ServerException(response.toString());
      }
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      print("DioException is $e");
      throw ServerException(e.response?.data ?? "Unknow Error");
    } catch (e) {
      print("Exception is $e");
      throw ServerException(e.toString());
    }
  }
}
