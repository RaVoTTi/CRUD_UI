import 'package:flutter/material.dart';
import 'package:frontend_flutter/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'package:frontend_flutter/helpers/app_common.dart';
import 'package:frontend_flutter/providers/login_form_provider.dart';
import 'package:frontend_flutter/widgets/widgets.dart';
import 'package:email_validator/email_validator.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        // create: (_) => LoginFormProvider(authProvider),

        child: Builder(builder: (context) {
          final loginFormProvider =
              Provider.of<LoginFormProvider>(context, listen: false);
          return Padding(
            padding: EdgeInsets.all(size.height > 770
                ? 64
                : size.height > 670
                    ? 32
                    : 16),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                height: size.height *
                    (size.height > 770
                        ? 0.7
                        : size.height > 670
                            ? 0.8
                            : 0.9),
                width: 500,
                child: Center(
                    child: SingleChildScrollView(
                        child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Form(
                    key: loginFormProvider.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 100,
                            child: Image(
                                image: AssetImage('assets/image/logocum.png'))),
                        SizedBox(
                          height: 40,
                        ),
                        FachaText(
                          title: "Iniciar Sesion",
                          size: 18,
                          weight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 30,
                          child: Divider(
                            color: AppColor.violet,
                            thickness: 2,
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Inputiala(
                          onChanged: (value) {
                            loginFormProvider.email = value;
                          },
                          icon: Icons.mail_outline,
                          label: 'Email',
                          validations: (value) {
                            if (!EmailValidator.validate(value ?? ''))
                              return 'Email no valido';
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Inputiala(
                          onChanged: (value) {
                            loginFormProvider.password = value;
                          },
                          icon: Icons.lock_outline,
                          label: 'Contraseña',
                          validations: (value) {
                            if (value == null || value.isEmpty)
                              return 'Ingrese su contraseña';
                            if (value.length < 6)
                              return 'La contraseña debe ser de al menos 6 caracteres';
                            return null;
                          },
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 64,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final isValid = loginFormProvider.validateForm();
                            if (isValid) {
                              authProvider.login(loginFormProvider.email,
                                  loginFormProvider.password);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                              primary: AppColor.green,
                              onPrimary: Colors.white.withOpacity(1.0),
                              shape: StadiumBorder()),
                          child: Center(
                            child: FachaText(
                              title: 'Iniciar Sesion',
                              color: Colors.white,
                              size: 18,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                ))),
              ),
            ),
          );
        }));
  }

  InputDecoration buildInputDecoration(
      {required String hint, required String label, required IconData icon}) {
    return InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.violet),
        ),
        labelStyle: TextStyle(color: AppColor.violet),
        hintText: hint,
        suffixIcon: Icon(icon));
  }
}
