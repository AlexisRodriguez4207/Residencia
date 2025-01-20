import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:residencia_v2/Config/Preferences/shared_preferences.dart';
import 'package:residencia_v2/Config/Services/database_services.dart';
import 'package:residencia_v2/Config/Services/theme_provider.dart';
import 'package:residencia_v2/Config/Theme/theme.dart';
import 'package:residencia_v2/Screen/Custom/custom_form_text_field.dart';
import 'package:sizer/sizer.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final _formKey = GlobalKey<FormBuilderState>();
  var prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ThemeProvider>(context, listen: true).themeData;

    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;

    return Scaffold(
      //Cambiar color de fondo
      // Revisar que colores aplican
      backgroundColor: colors.surface,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          heroTag: 'floating1',
          onPressed: () {
            // Cambiar Tema
            Provider.of<ThemeProvider>(context, listen: false).switchTheme();
          },
          child: Icon(
              provider == lightTheme ? Icons.sunny : Icons.mode_night_rounded),
        ),
        SizedBox(height: 2.h),
        FloatingActionButton(
          heroTag: 'floating2',
          onPressed: () {
            // Agregar Notas
            showdialogadd(context);
          },
          child: Icon(Icons.add),
        ),
        SizedBox(height: 2.h),
        FloatingActionButton(
          heroTag: 'floating3',
          onPressed: () {
            // Agregar Notas
            Navigator.pushReplacementNamed(context, '/dashboard');
          },
          child: Icon(Icons.arrow_back),
        )
      ]),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Notas',
          style: texts.titleMedium,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 80.h,
            width: 70.w,
            child: StreamBuilder(
              stream: DatabaseServices().notelist(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: const CircularProgressIndicator());
                } else {
                  var notes = snapshot.data.docs;

                  return ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10.sp),
                        margin: EdgeInsets.only(bottom: 2.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.pinkAccent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 40.w,
                              child: Text(
                                // $notes[index]['text'],
                                '${notes[index]['text'] + ' - ' + notes[index]['date'].toDate().toString().substring(0, 16)}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        // Editar Nota
                                        showDialogUpdate(
                                            context,
                                            notes[index]['text'],
                                            notes[index].id);
                                      },
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        // Eliminar Nota
                                        DatabaseServices()
                                            .deleteNote(notes[index].id);
                                      },
                                      icon: const Icon(Icons.delete_outline)),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showdialogadd(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: FormBuilder(
              key: _formKey,
              child: Container(
                height: 40.h,
                child: Column(
                  children: [
                    CustomFormTextField(
                        nombre: 'titulo',
                        hint: 'Ingresa un Titulo',
                        label: 'Titulo',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(1),
                        ])),
                    CustomFormTextField(
                        nombre: 'notas',
                        hint: 'Ingresa un texto',
                        label: 'Notas',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.minLength(1),
                        ])),
                  ],
                ),
              )),
          actions: [
            TextButton(
              onPressed: () {
                //Cerrar dialog
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
                style: TextStyle(color: colors.primary),
              ),
            ),
            TextButton(
              onPressed: () async {
                //Guardar Notas
                _formKey.currentState?.save();
                if (_formKey.currentState?.validate() == true) {
                  final nota = _formKey.currentState!.value;
                  await DatabaseServices().addNote(nota['notas']);
                  if (context.mounted) {
                    Navigator.pop(context);
                    _formKey.currentState?.reset();
                  }
                }
              },
              child: Text('Guardar', style: TextStyle(color: colors.primary)),
            )
          ],
        );
      },
    );
  }

  // Editar Notas
  Future<dynamic> showDialogUpdate(
      BuildContext context, String initialValue, String uidNota) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: FormBuilder(
            key: _formKey,
            child: CustomFormTextField(
                initialValue: initialValue,
                nombre: 'notas',
                hint: 'Ingresa un texto',
                label: 'Notas',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.minLength(1),
                ])),
          ),
          actions: [
            TextButton(
              onPressed: () {
                //Cerrar dialog
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                //Guardar Notas
                _formKey.currentState?.save();
                if (_formKey.currentState?.validate() == true) {
                  final nota = _formKey.currentState!.value;
                  await DatabaseServices().updateNote(uidNota, nota['notas']);
                  if (context.mounted) {
                    Navigator.pop(context);
                    _formKey.currentState?.reset();
                  }
                }
              },
              child: const Text('Guardar'),
            )
          ],
        );
      },
    );
  }
}
