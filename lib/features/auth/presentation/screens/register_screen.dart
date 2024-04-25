
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/widgets/widgets.dart';
import '../providers/auth_provider.dart';
import '../providers/register_form_provider.dart';
import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);
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
                'Crear una\nnueva cuenta',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(
                height: 25,
              ),
              RegisterForm(),

              //Check box and terms and conditions
              SizedBox(
                height: 25,
              ),
              //In bottom
            ],
          ),
        ),
      ),
      bottomNavigationBar:  AuthBottomNavigationBar(
        isLoading: authProvider.isLoading,
        label: 'Tienes una cuenta?',
        labelPressed: 'Iniciar sesión',
        buttonLabel: authProvider.isLoading ? 'Cargando...' : 'Registrarse',
        onPressedLabel: (){
          // navegar sin poder regresar
          Navigator.pushReplacementNamed(context, '/login');
        },
        onPressedButton: (){
          FocusScope.of(context).unfocus();
          if (!registerForm.isValidForm()){
            ToastCustom.show('Por favor llena todos los campos');
            return;
          }
          authProvider.registerEmailAndPassword(registerForm.email, registerForm.password);
          if (authProvider.hasError) {
            //show alert
            ToastCustom.show('Error al registrar');
            return;
          }
          //navigate to home and not back
          Navigator.pushReplacementNamed(context, '/home');

        },
      ),
    );
  }
}






