import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:residencia_v2/Config/Services/auth_Services.dart';
import 'package:residencia_v2/Screen/Custom/custom_form_text_field.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey2 = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: SizedBox(
        child: ElevatedButton(
            onPressed: () async {
              //Pantalla de Carga
              SmartDialog.showLoading(
                  msg: 'Creando Cuenta...', maskColor: Colors.red);

              //Guardar datos del formulario
              _formKey2.currentState?.save();

              if (_formKey2.currentState!.validate() == true) {
                final formulario = _formKey2.currentState?.value;

                //Imprimir datos del formulario
                print(formulario);

                var response = await AuthServices().createAccount(
                  // ! = no puede ser null
                  formulario!['name'],
                  formulario['lastname'],
                  formulario['age'],
                  formulario['email'],
                  formulario['password'],
                );

                if (response == 3) {
                  // Cancela la carga de la pantalla
                  SmartDialog.dismiss();

                  //mounted = si la pantalla esta montada
                  if (context.mounted) {
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  }
                } else {
                  SmartDialog.dismiss();
                  print('Error al crear la cuenta');
                }
              }
            },
            child: Text('Crear Cuenta')),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Crear Cuenta',
          style: TextStyle(fontSize: 22.sp),
        ),
      ),
      body: SingleChildScrollView(
        // No funcionaba
        child: FormBuilder(
          key: _formKey2,
          child: Column(
            children: [
              CustomFormTextField(
                  nombre: 'name',
                  hint: 'Ingresa Tu Nombre',
                  label: 'Nombre',
                  // icon: Icons.person,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.firstName(
                        errorText: 'Ingresa solo caracteres validos.'),
                  ])),
              CustomFormTextField(
                  nombre: 'lastname',
                  hint: 'Ingresa tus Apellidos',
                  label: 'Apellido',
                  // icon: null,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.lastName(
                        errorText: 'Ingresa solo letras.'),
                  ])),
              CustomFormTextField(
                  nombre: 'age',
                  hint: 'Ingresa tu Edad',
                  label: 'Edad',
                  // icon: Icons.calendar_today,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.integer(
                        errorText: 'Ingresa una Edad valida.'),
                  ])),
              CustomFormTextField(
                nombre: 'email',
                hint: 'example@example.com',
                label: 'Correo',
                // icon: Icons.email,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(
                      errorText: 'Ingresa un Email valido.'),
                ]),
              ),
              CustomFormTextField(
                nombre: 'password',
                hint: '**********',
                label: 'Contraseña',
                obscureText: true,
                // icon: Icons.password,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(8,
                      errorText:
                          'La contraseña debe contener minimo 8 caracteres.'),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
