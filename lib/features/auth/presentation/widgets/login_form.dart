import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_form_provider.dart';
import 'widgets.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => loginForm.email = value,
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
              onChanged: (value) => loginForm.password = value,
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
          ],
        ));
  }
}
