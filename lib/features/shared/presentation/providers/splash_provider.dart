import 'package:flutter/cupertino.dart';

import '../../domain/usecases/validation_token_usecase.dart';

class SplashProvider extends ChangeNotifier {
  final ValidationTokenUseCase validationTokenUseCase = ValidationTokenUseCase();
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  SplashProvider(){
    checkAuthentication();
  }

  Future<void> checkAuthentication() async {
    _isAuthenticated = await validationTokenUseCase();
    notifyListeners();
  }
}
