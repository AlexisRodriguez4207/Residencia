import 'package:flutter/material.dart';
import 'package:residencia_v2/Screen/Modules/Games/Ahorcado/Utils/game.dart';
import 'package:residencia_v2/Screen/Modules/Games/Ahorcado/Widget/figure_image.dart';
import 'package:residencia_v2/Screen/Modules/Games/Ahorcado/Widget/letter.dart';
import 'package:residencia_v2/Screen/Modules/Games/Ahorcado/colors.dart';
import 'package:residencia_v2/Screen/Modules/Games/Ahorcado/constant/constant.dart';

class Hangman extends StatefulWidget {
  const Hangman({super.key});

  @override
  State<Hangman> createState() => _HangmanState();
}

class _HangmanState extends State<Hangman> {
  //Palabras
  String word = "Flutter".toUpperCase();

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color.fromARGB(210, 157, 179, 241),
      appBar: AppBar(
        title: Text(
          'Ahorcado',
          style: TextStyle(color: colors.tertiary),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: colors.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                figureImage(GameHang.tries >= 0, "assets/hang.png"),
                figureImage(GameHang.tries >= 1, "assets/head.png"),
                figureImage(GameHang.tries >= 2, "assets/body.png"),
                figureImage(GameHang.tries >= 3, "assets/ra.png"),
                figureImage(GameHang.tries >= 4, "assets/la.png"),
                figureImage(GameHang.tries >= 5, "assets/rl.png"),
                figureImage(GameHang.tries >= 6, "assets/ll.png"),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
                .split("")
                .map((e) => letter(e.toUpperCase(),
                    !GameHang.selectedChar.contains(e.toUpperCase())))
                .toList(),
          ),
          SizedBox(
            height: 12.0,
          ),
          SizedBox(
            width: double.infinity,
            height: 270.0,
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: alphabets.map((e) {
                return RawMaterialButton(
                  onPressed: GameHang.selectedChar.contains(e)
                      ? null
                      : () {
                          setState(() {
                            GameHang.selectedChar.add(e);
                            print(GameHang.selectedChar);
                            if (!word.split('').contains(e.toUpperCase())) {
                              GameHang.tries++;
                            }
                          });
                        },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  fillColor: GameHang.selectedChar.contains(e)
                      ? const Color.fromARGB(221, 16, 16, 16)
                      : Colors.blue,
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
