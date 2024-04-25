import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:crypto_view/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../auth/presentation/screens/login_screen.dart';
import '../providers/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashProvider = Provider.of<SplashProvider>(context);
    return AnimatedSplashScreen(
      splash: SizedBox(
        child: Center(
          child: LottieBuilder.asset('assets/animations/loader.json',width: 1000,height: 1000,)
          ,
        ),
      ),
      nextScreen: splashProvider.isAuthenticated ? const LoginScreen() : const RegisterScreen(),
      nextRoute: splashProvider.isAuthenticated ? '/login' : '/register',
      backgroundColor: const Color(0xff0747A1),
    );
  }
}
