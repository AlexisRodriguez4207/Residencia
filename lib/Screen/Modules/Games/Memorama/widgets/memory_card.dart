// import 'package:flutter/material.dart';
// import 'package:residencia_v2/Screen/Modules/Games/Memorama/Models/card_item.dart';

// class MemoryCard extends StatelessWidget {
//   final CardItem cardItem;
//   final Function(int) onCardPressed;
//   final int index;

//   const MemoryCard(
//       {Key? key,
//       required this.cardItem,
//       required this.index,
//       required this.onCardPressed})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (cardItem.state == CardState.hidden) {
//           onCardPressed(index);
//         }
//       },
//       child: Card(
//         margin: const EdgeInsets.all(4),
//         elevation: 8,
//         clipBehavior: Clip.antiAlias,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         color: cardItem.state == CardState.visible ||
//                 cardItem.state == CardState.guessed
//             ? cardItem.color
//             : Colors.grey,
//         child: Center(
//           child: cardItem.state == CardState.hidden
//               ? null
//               : Icon(cardItem.icon, size: 50, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/Models/card_item.dart';

class MemoryCard extends StatelessWidget {
  const MemoryCard({
    required this.card,
    required this.index,
    required this.onCardPressed,
    super.key,
  });

  final CardItem card;
  final int index;
  final ValueChanged<int> onCardPressed;

  void _handleCardTap() {
    if (card.state == CardState.hidden) {
      Timer(const Duration(milliseconds: 100), () {
        onCardPressed(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleCardTap,
      child: Card(
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color:
            card.state == CardState.visible || card.state == CardState.guessed
                ? card.color
                : Colors.grey,
        child: Center(
          child: card.state == CardState.hidden
              ? null
              : SizedBox.expand(
                  child: FittedBox(
                    child: Icon(
                      card.icon,
                      color: Colors.white,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
