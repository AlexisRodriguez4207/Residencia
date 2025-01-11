import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:residencia_v2/Config/Preferences/shared_preferences.dart';
import 'package:residencia_v2/Screen/Custom/custom_form_text_field.dart';
import 'package:sizer/sizer.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
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
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: FormBuilder(
                    child: CustomFormTextField(
                        nombre: 'Notas',
                        hint: 'Ingresa un texto',
                        label: 'Notas'),
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add),
        )
      ]),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notas'),
      ),
    );
  }
}
