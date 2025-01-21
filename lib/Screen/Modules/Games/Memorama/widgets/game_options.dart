import 'package:flutter/material.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/Pages/memory_match_page.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/utils/constants.dart';
import 'package:residencia_v2/Screen/Modules/Games/memorama.dart';

class GameOptions extends StatelessWidget {
  const GameOptions({
    super.key,
  });

  static Route<dynamic> _routeBuilder(BuildContext context, int gameLevel) {
    return MaterialPageRoute(
      builder: (_) {
        return MemoryMatchPage(gameLevel: gameLevel);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: gameLevels.map((level) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GameButton(
            onPressed: () => Navigator.of(context).pushReplacement(
              _routeBuilder(context, level['level']),
            ),
            title: level['title'],
            color: level['color']![700]!,
            width: 250,
          ),
        );
      }).toList(),
    );
  }
}
