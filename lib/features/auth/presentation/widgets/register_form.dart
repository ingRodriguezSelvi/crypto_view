import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_form_provider.dart';
import '../providers/register_form_provider.dart';
import 'widgets.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormProvider>(context);
    return Form(
        key: registerForm.formRegisterKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => registerForm.email = value,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Correo',
                labelText: 'Correo',
              ),
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Correo invalido';
              },
            ),
            const SizedBox(
              height: 35,
            ),
            TextFormField(
              onChanged: (value) => registerForm.password = value,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Contraseña',
                labelText: 'Contraseña',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return 'Contraseña requerida';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 35,
            ),
            TextFormField(
              onChanged: (value) => registerForm.confirmPassword = value,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Confirmar contraseña',
                labelText: 'Confirmar contraseña',
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return 'Contraseña requerida';
                }
                if (value != registerForm.password) {
                  return 'Las contraseñas no coinciden';
                }
                return null;
              },
            ),

          ],
        ));
  }
}
