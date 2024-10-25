part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

final class SignUpEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final UserType userType;
  final String userName;
  final String email;
  final String password;
  final String country;
  const SignUpEvent(
      {required this.firstName,
      required this.lastName,
      required this.userType,
      required this.userName,
      required this.email,
      required this.password,
      required this.country});
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  const SignInEvent({required this.email, required this.password});
}

final class AuthIsUserLoggedIn extends AuthEvent {}
