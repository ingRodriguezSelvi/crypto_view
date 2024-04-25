import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/widgets/widgets.dart';
import '../providers/auth_provider.dart';
import '../providers/login_form_provider.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: customAppBar(),
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hola bienvenido!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(
                height: 35,
              ),
              LoginForm(),
              //In bottom
            ],
          ),
        ),
      ),
      bottomNavigationBar: AuthBottomNavigationBar(
        isLoading: authProvider.isLoading,
        label: 'No tienes cuenta?',
        labelPressed: 'Registrate',
        buttonLabel: authProvider.isLoading ? 'Cargando...' : 'Iniciar sesión',
        onPressedLabel: () {
          // navegar sin poder regresar
          Navigator.pushReplacementNamed(context, '/register');
        },
        onPressedButton: () async {
          FocusScope.of(context).unfocus();
          if (!loginForm.isValidForm()){
            ToastCustom.show('Por favor llena todos los campos');
            return;
          }
          await authProvider.loginEmailAndPassword(loginForm.email, loginForm.password);
          if (authProvider.hasError) {
           //show alert
            ToastCustom.show('Email o contraseña incorrectos');
            return;
          }
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
    );
  }


}
