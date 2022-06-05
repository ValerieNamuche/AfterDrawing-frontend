class RegisterDto {
  String email = '';
  String userName = '';
  String password = '';
  String firstName = '';
  String lastName = '';

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": userName,
        "password": password,
        "firstname": firstName,
        "lastName": lastName
      };
}
