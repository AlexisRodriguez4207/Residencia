import 'package:flutter/material.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/Pages/startup_page.dart';

class TheMemoryMatchGame extends StatelessWidget {
  const TheMemoryMatchGame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartUpPage(),
      title: 'Juego de Memorama',
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //       titleTextStyle: TextStyle(
      //     color: Colors.black,
      //   ),),

      // theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}
