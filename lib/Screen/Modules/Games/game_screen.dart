import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GamesMenu extends StatefulWidget {
  const GamesMenu({super.key});

  @override
  State<GamesMenu> createState() => _GamesMenuState();
}

class _GamesMenuState extends State<GamesMenu> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Minijuegos'),
        actions: [
          IconButton(
            onPressed: () {
              //Cerrar sesion
              _auth.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Bienvenido a la pantalla de Minijuegos',
              style: TextStyle(color: colors.primary),
            ),
            SizedBox(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        //Registro de usuario
                        Navigator.pushReplacementNamed(context, '/notes');
                      },
                      child: const Text('Sudoku')),
                  ElevatedButton(
                      onPressed: () {
                        //Registro de usuario
                        Navigator.pushReplacementNamed(context, '/memorama');
                      },
                      child: const Text('Memorama')),
                  ElevatedButton(
                      onPressed: () {
                        //Registro de usuario
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      child: const Text('XD'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
