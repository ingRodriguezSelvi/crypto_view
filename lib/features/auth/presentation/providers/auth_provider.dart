
import 'package:crypto_view/features/auth/domain/usecases/registerEmailAndPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/usecases/loginEmailAndPassword.dart';

class AuthProvider extends ChangeNotifier {
  final LoginEmailAndPassword loginEmailAndPasswordUseCase;
  final RegisterEmailAndPassword registerEmailAndPasswordUseCase;


  bool _isLoading = false;
  bool _hasError = false;

  AuthProvider({required this.loginEmailAndPasswordUseCase, required this.registerEmailAndPasswordUseCase});

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<void> loginEmailAndPassword(String email, String password) async {
    try{
      _isLoading = true;
      notifyListeners();
      await loginEmailAndPasswordUseCase(email, password);
      _hasError = false;
      _isLoading = false;
      notifyListeners();

    } catch (e) {
      _isLoading = false;
      _hasError = true;
      notifyListeners();
    }
  }

  Future<void> registerEmailAndPassword(String email, String password) async {
    try{
      _isLoading = true;
      notifyListeners();
      await registerEmailAndPasswordUseCase(email, password);
      _hasError = false;
      _isLoading = false;
      notifyListeners();

    } catch (e) {
      _isLoading = false;
      _hasError = true;
      notifyListeners();
    }
  }

}
