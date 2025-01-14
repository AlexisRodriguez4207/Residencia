import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:residencia_v2/Config/Services/auth_Services.dart';
import 'package:residencia_v2/Screen/Custom/custom_form_text_field.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Iniciar Sesión',
                    style: texts.titleMedium,
                  ),
                  CustomFormTextField(
                    nombre: 'email',
                    hint: 'example@example.com',
                    label: 'Email',
                    // icon: Icons.email,
                  ),
                  CustomFormTextField(
                    nombre: 'password',
                    hint: '**********',
                    label: 'Password',
                    // icon: Icons.password,
                  ),
                  SizedBox(
                    child: ElevatedButton(
                        onPressed: () async {
                          //Inicio de sesion
                          SmartDialog.showLoading(
                              msg: 'Iniciando Sesión...',
                              maskColor: Colors.lightBlue);

                          //Guardar datos del formulario
                          _formKey.currentState?.save();

                          if (_formKey.currentState!.validate() == true) {
                            final formulario = _formKey.currentState?.value;

                            var response = await AuthServices().signAccount(
                              formulario!['email'],
                              formulario['password'],
                            );

                            if (response == 3) {
                              // Cancela la carga de la pantalla
                              SmartDialog.dismiss();

                              //mounted = si la pantalla esta montada
                              if (context.mounted) {
                                Navigator.pushReplacementNamed(
                                    context, '/dashboard');
                              }
                            } else {
                              SmartDialog.dismiss();
                              print('Error al crear la cuenta');
                            }
                          }
                        },
                        child: Text(
                          'Iniciar Sesión',
                          style: TextStyle(color: colors.primary),
                        )),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'No tienes cuenta?',
                    style: TextStyle(color: colors.primary),
                    // style:
                    //     TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        //Registro de usuario
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      child: Text('Registrarse',
                          style: TextStyle(color: colors.primary)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
