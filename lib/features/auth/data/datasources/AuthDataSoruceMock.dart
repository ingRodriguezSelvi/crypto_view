import '../models/AuthLoginResponse.dart';

class AuthDataSourceMock {
  //List of users
  static List<Map<String, dynamic>> users = [
    {'email': 'test@test.com', 'password': '123456'},
  ];

  static Future<AuthResponse> loginEmailAndPassword(
      String email, String password) async {
    //Simulate a delay
    await Future.delayed(Duration(seconds: 1));
    //Search for the user
    final user = users.firstWhere(
        (user) => user['email'] == email,
        orElse: () => {'email': '', 'password': ''});

    //If the user is not found, return an error
    if (user['email'] == '') {
      return AuthResponse(
        token: '',
        refreshToken: '',
        error: 'User not found',
      );
    }

    //If the password is incorrect, return an error
    if (user['password'] != password) {
      return AuthResponse(
        token: '',
        refreshToken: '',
        error: 'Incorrect password',
      );
    }

    //If the user is found, return the token and refreshToken
    return AuthResponse(
      token: 'token',
      refreshToken: 'refreshToken',
      error: null,
    );
  }

  static Future<AuthResponse> registerEmailAndPassword(
      String email, String password) async {
    //Simulate a delay
    await Future.delayed(Duration(seconds: 1));
    //Search for the user
    final user = users.firstWhere(
        (user) => user['email'] == email,
        orElse: () => {'email': '', 'password': ''});
    print(user);

    //If the user is found, return an error
    if (user['email'] != '') {
      return AuthResponse(
        token: '',
        refreshToken: '',
        error: 'User already exists',
      );
    }

    //If the user is not found, add the user to the list
    users.add({'email': email, 'password': password});

    //Return the token and refreshToken
    return AuthResponse(
      token: 'token',
      refreshToken: 'refreshToken',
      error: null,
    );
  }
}
