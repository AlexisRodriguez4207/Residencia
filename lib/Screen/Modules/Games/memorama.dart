import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  const GameButton({
    required this.title,
    required this.onPressed,
    required this.color,
    this.height = 40,
    this.width = double.infinity,
    this.fontSize = 18,
    Key? key,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final Color color;
  final double height;
  final double width;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: SizedBox(
        height: 50.0,
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(211, 221, 230, 1000),
              textStyle: const TextStyle(fontSize: 20),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
            ),
            onPressed: onPressed,
            child: Text(title)),
      ),
    );
  }
}
