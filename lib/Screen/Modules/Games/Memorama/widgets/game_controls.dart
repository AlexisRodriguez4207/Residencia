import 'package:flutter/material.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/Pages/startup_page.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/utils/constants.dart';
import 'package:residencia_v2/Screen/Modules/Games/memorama.dart';

class GameControlsBottomSheet extends StatelessWidget {
  const GameControlsBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Pausar',
              style: TextStyle(fontSize: 24, color: colors.primary),
            ),
          ),
          SizedBox(height: 10),
          GameButton(
            onPressed: () => Navigator.of(context).pop(false),
            title: 'Continuar',
            color: const Color.fromARGB(255, 20, 18, 19),
            width: 200,
          ),
          const SizedBox(height: 10),
          GameButton(
            onPressed: () => Navigator.of(context).pop(true),
            title: 'Reinicar',
            color: const Color.fromARGB(255, 134, 140, 172),
            width: 200,
          ),
          const SizedBox(height: 10),
          GameButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const StartUpPage();
                  },
                ),
                (Route<dynamic> route) => false,
              );
            },
            title: 'Salir al Menú',
            color: quitButtonColor,
            width: 200,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
