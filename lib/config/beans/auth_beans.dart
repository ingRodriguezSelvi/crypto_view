import '../../features/auth/domain/usecases/registerEmailAndPassword.dart';
import 'package:crypto_view/features/auth/domain/usecases/loginEmailAndPassword.dart';

import '../../features/auth/data/repositories/auth_repository_impl.dart';

class AuthBeans {

   static authRepository() {
     return AuthRepositoryImpl();
   }

   static loginAndPasswordUseCase() {
     return LoginEmailAndPassword(authRepository());
   }

   static registerEmailAndPasswordUseCase() {
     return RegisterEmailAndPassword(authRepository());
   }
}
