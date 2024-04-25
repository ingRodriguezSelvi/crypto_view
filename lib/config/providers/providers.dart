import 'package:crypto_view/features/auth/presentation/providers/auth_provider.dart';
import 'package:crypto_view/features/auth/presentation/providers/login_form_provider.dart';
import 'package:crypto_view/features/auth/presentation/providers/register_form_provider.dart';
import 'package:crypto_view/features/shared/presentation/providers/splash_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../beans/beans.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(
      create: (_) => AuthProvider(
          loginEmailAndPasswordUseCase: AuthBeans.loginAndPasswordUseCase(),
          registerEmailAndPasswordUseCase:
              AuthBeans.registerEmailAndPasswordUseCase())),
  ChangeNotifierProvider(create: (_) => LoginFormProvider()),
  ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
  ChangeNotifierProvider(create: (_) => SplashProvider())
];
