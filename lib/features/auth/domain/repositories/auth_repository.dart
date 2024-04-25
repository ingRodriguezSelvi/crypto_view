
import '../entities/UserAuth.dart';

abstract class AuthRepository {
  Future<UserAuth> loginEmailAndPassword(String email, String password);
  Future<UserAuth> registerEmailAndPassword(String email, String password);
}
