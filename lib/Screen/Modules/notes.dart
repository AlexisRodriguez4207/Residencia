import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:residencia_v2/Config/Preferences/shared_preferences.dart';
import 'package:residencia_v2/Config/Services/database_services.dart';
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
    prefs.lastpage = '/dashboard';
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          heroTag: 'floating1',
          onPressed: () {},
          child: const Icon(Icons.sunny),
        ),
        SizedBox(height: 2.h),
        FloatingActionButton(
          heroTag: 'floating2',
          onPressed: () {
            // Agregar Notas
            showdialogadd(context);
          },
          child: const Icon(Icons.add),
        )
      ]),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notas'),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.pinkAccent,
                        ),
                        height: 6.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              notes[index]['text'],
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {},
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
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: FormBuilder(
            key: _formKey,
            child: CustomFormTextField(
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
                  await DatabaseServices().addNote(nota['notas']);
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
