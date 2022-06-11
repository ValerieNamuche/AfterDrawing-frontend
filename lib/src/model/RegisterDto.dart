class RegisterDto {
  String email = '';
  String userName = '';
  String password = '';
  String firstName = '';
  String lastName = '';

  Map<String, dynamic> toJson() => {
        "email": email,
        "userName": userName,
        "password": password,
        "firstName": firstName,
        "lastName": lastName
      };
}
