import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/shared/presentation/screens/splash_screen.dart';


Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const SplashScreen(),
  '/login':(context) => const LoginScreen(),
  '/register':(context) => const RegisterScreen(),
  '/home': (context) => const HomeScreen()
};
