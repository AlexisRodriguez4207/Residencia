import 'package:flutter/material.dart';
import 'package:residencia_v2/Screen/Modules/Games/Ahorcado/colors.dart';

Widget letter(String character, bool hidden) {
  return Container(
    height: 65,
    width: 50,
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: AppColor.primaryColorDarkk,
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Visibility(
        visible: !hidden,
        child: Text(
          character,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40.0),
        )),
  );
}
