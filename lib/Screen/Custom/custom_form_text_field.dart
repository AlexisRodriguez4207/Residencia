import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    required this.nombre,
    required this.hint,
    required this.label,
    // this.icon,
    this.obscureText,
    this.validator,
    this.initialValue,
  });

  final String nombre;
  final String? hint;
  final String label;
  // final IconData? icon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
      child: FormBuilderTextField(
        // valida mientras el usuario interactua con el campo
        autovalidateMode: AutovalidateMode.onUserInteraction,
        name: nombre,
        // Si viene vacio el valor inicial se pone un string vacio
        initialValue: initialValue ?? '',
        style: TextStyle(color: Colors.black),
        //Validar Forms
        validator: validator,
        obscureText: obscureText ?? false,

        decoration: InputDecoration(
          //Revisar si se puede cambiar el color del fondo
          filled: true,
          // fillColor: Colors.blueAccent,
          hintText: hint ?? '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black),
          ),
          //Suffix Icon va adelante
          //Prefix Icon va atras
          // suffix: Icon(Icons.email),
          // prefix: Icon(Icons.password),

          label: Text(label),
          labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold),
          hintStyle: TextStyle(color: Colors.black),
          // suffix: Icon(icon),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}
