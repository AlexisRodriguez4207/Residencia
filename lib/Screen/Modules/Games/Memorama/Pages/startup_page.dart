import 'package:flutter/material.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/Pages/memory_match_page.dart';
import 'package:residencia_v2/Screen/Modules/Games/memorama.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.primary,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Partida de Memorama',
              style: TextStyle(
                fontSize: 28,
                color: colors.primary,
              ),
            ),
          ),
          GameButton(
            title: 'Comenzar',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const MemoryMatchPage();
                  },
                ),
              );
            },
          )
        ],
      )),
    );
  }
}
