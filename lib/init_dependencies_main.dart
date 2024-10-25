import 'package:aak_tele_science/core/interceptors/api_interceptor.dart';
import 'package:aak_tele_science/core/secrets/app_secrets.dart';
import 'package:aak_tele_science/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:aak_tele_science/features/auth/domain/repository/auth_repository.dart';
import 'package:aak_tele_science/features/auth/domain/repository/auth_repository_impl.dart';
import 'package:aak_tele_science/features/auth/domain/usecases/user_login.dart';
import 'package:aak_tele_science/features/auth/domain/usecases/user_signup.dart';
import 'package:aak_tele_science/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  BaseOptions options = BaseOptions(
    baseUrl: AppSecrets.baseUrl,
    contentType: Headers
        .jsonContentType, //Headers.formUrlEncodedContentType, //"application/json",
    followRedirects: false,
    responseType: ResponseType.plain,
    connectTimeout: Duration(seconds: 20),
    receiveTimeout: Duration(seconds: 20),
    // validateStatus: (status) {
    //   return status! < 500;
    // },
  );
  Dio dio = Dio(options);
  serviceLocator.registerLazySingleton<ApiInterceptor>(() => ApiInterceptor());
  dio.interceptors.add(serviceLocator<ApiInterceptor>());
  serviceLocator.registerLazySingleton<Dio>(() => dio);
  _initAuth();
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(dioClient: serviceLocator<Dio>()));

  serviceLocator.registerFactory<AuthRepository>(() => AuthRepositoryImpl(
      authRemoteDataSource: serviceLocator<AuthRemoteDataSource>()));

  serviceLocator.registerFactory<UserSignUp>(
      () => UserSignUp(authRepository: serviceLocator<AuthRepository>()));
  serviceLocator.registerFactory<UserLogin>(
      () => UserLogin(authRepository: serviceLocator<AuthRepository>()));

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator<UserSignUp>(),
      userLogin: serviceLocator<UserLogin>(),
    ),
  );
}
