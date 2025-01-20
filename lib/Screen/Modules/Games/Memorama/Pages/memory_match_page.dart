import 'dart:async';

import 'package:flutter/material.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/Models/game.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/game_timer.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/widgets/memory_card.dart';
import 'package:residencia_v2/Screen/Modules/Games/memorama.dart';

class MemoryMatchPage extends StatefulWidget {
  const MemoryMatchPage({super.key});

  @override
  State<MemoryMatchPage> createState() => _MemoryMatchPageState();
}

class _MemoryMatchPageState extends State<MemoryMatchPage> {
  Timer? timer;
  Game? game;

  @override
  void initState() {
    super.initState();
    game = Game(4);
    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        game!.time = game!.time + 1;
      });
      if (game!.isGameOver) {
        timer!.cancel();
      }
    });
  }

  void _resetGame() {
    game!.resetGame();
    setState(() {
      timer!.cancel();
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
              child: GameTimer(time: game!.time),
            ),
            Expanded(
              flex: 3,
              child: GridView.count(
                crossAxisCount: game!.gridSize,
                children: List.generate(game!.cards.length, (index) {
                  return MemoryCard(
                    cardItem: game!.cards[index],
                    index: index,
                    onCardPressed: game!.onCardPressed,
                  );
                }),
              ),
            ),
            if (game!.isGameOver)
              Expanded(
                flex: 1,
                child: GameButton(
                  title: 'Intentar De Nuevo',
                  onPressed: () => _resetGame(),
                ),
              )
            else
              const Expanded(
                flex: 1,
                child: SizedBox(),
              )
          ],
        ),
      ),
    );
  }
}
