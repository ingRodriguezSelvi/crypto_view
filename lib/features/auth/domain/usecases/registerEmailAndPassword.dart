
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../entities/UserAuth.dart';
import '../repositories/auth_repository.dart';

class RegisterEmailAndPassword {
  final AuthRepository _authRepository;
  final storage = const FlutterSecureStorage();

  RegisterEmailAndPassword(this._authRepository);

  Future<void> call(String email, String password) async {
    UserAuth user =  await _authRepository.registerEmailAndPassword(email, password);
    await storage.write(key: 'token', value: user.token);
  }
}
