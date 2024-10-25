class User {
  final String status;
  final int userId;
  final String userType;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String country;
  final String userActiveStatus;
  final String message;

  User(
      {required this.status,
      required this.userId,
      required this.userType,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.country,
      required this.userActiveStatus,
      required this.message});
}
