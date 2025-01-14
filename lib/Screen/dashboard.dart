import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Dashboard'),
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
              'Bienvenido a la pantalla de Dashboard',
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
                      child: const Text('Notas')),
                  ElevatedButton(
                      onPressed: () {
                        //Registro de usuario
                        Navigator.pushReplacementNamed(context, '/maps');
                      },
                      child: const Text('Ubicación')),
                  ElevatedButton(
                      onPressed: () {
                        //Registro de usuario
                        Navigator.pushReplacementNamed(context, '/games');
                      },
                      child: const Text('Juegos'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
