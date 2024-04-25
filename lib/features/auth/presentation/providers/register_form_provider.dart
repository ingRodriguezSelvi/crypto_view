

import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formRegisterKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String confirmPassword = '';

  bool isValidForm() {
    return formRegisterKey.currentState?.validate() ?? false;
  }

}
