import 'dart:async';

import 'package:flutter/material.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/Models/game.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/widgets/game_timer.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/widgets/memory_card.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/widgets/restart_game.dart';

class MemoryMatchPage extends StatefulWidget {
  const MemoryMatchPage({super.key, required this.gameLevel});

  final int gameLevel;

  @override
  State<MemoryMatchPage> createState() => _MemoryMatchPageState();
}

class _MemoryMatchPageState extends State<MemoryMatchPage> {
  late Timer timer;
  late Game game;
  late Duration duration;

  @override
  void initState() {
    super.initState();
    game = Game(widget.gameLevel);
    duration = const Duration();
    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        final seconds = duration.inSeconds + 1;
        duration = Duration(seconds: seconds);
      });
      if (game.isGameOver) {
        timer.cancel();
      }
    });
  }

  pauserTimer() {
    timer.cancel();
  }

  void _resetGame() {
    game.resetGame();
    setState(() {
      timer.cancel();
      duration = const Duration();
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Memorama',
          style: TextStyle(color: colors.primary),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: GameTimer(
                time: duration,
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.count(
                crossAxisCount: game.gridSize,
                children: List.generate(game.cards.length, (index) {
                  return MemoryCard(
                    card: game.cards[index],
                    index: index,
                    onCardPressed: game.onCardPressed,
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 48.0),
              child: RestartGame(
                isGameOver: game.isGameOver,
                pauseGame: () => pauserTimer(),
                restartGame: () => _resetGame(),
                continueGame: () => startTimer(),
                color: colors.primary,
              ),
            )

            // if (game.isGameOver)
            //   Expanded(
            //     flex: 1,
            //     child: GameButton(
            //       title: 'Intentar De Nuevo',
            //       onPressed: () => _resetGame(),
            //     ),
            //   )
            // else
            //   const Expanded(
            //     flex: 1,
            //     child: SizedBox(),
            //   )
          ],
        ),
      ),
    );
  }
}
