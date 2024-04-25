
import 'package:crypto_view/features/auth/data/datasources/AuthDataSoruceMock.dart';
import 'package:crypto_view/features/auth/data/models/AuthLoginResponse.dart';

import '../../domain/entities/UserAuth.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  @override
  Future<UserAuth> loginEmailAndPassword(String email, String password) {
    Future<AuthResponse> response = AuthDataSourceMock.loginEmailAndPassword(email, password);
    return response.then((value) {
      if (value.error != null) {
        throw Exception(value.error);
      }
      print('Login exits');
      return UserAuth(token: value.token, email: value.refreshToken);
    });
  }

  @override
  Future<UserAuth> registerEmailAndPassword(String email, String password) {
    Future<AuthResponse> response = AuthDataSourceMock.registerEmailAndPassword(email, password);
    return response.then((value) {
      if (value.error != null) {
        throw Exception(value.error);
      }
      print('Register exits');
      return UserAuth(token: value.token, email: value.refreshToken);
    });
  }

}
