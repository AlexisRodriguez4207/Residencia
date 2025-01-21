// import 'package:flutter/material.dart';
// import 'package:residencia_v2/Screen/Modules/Games/Memorama/Pages/memory_match_page.dart';
// import 'package:residencia_v2/Screen/Modules/Games/memorama.dart';

// class StartupPage extends StatelessWidget {
//   const StartupPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var colors = Theme.of(context).colorScheme;
//     var texts = Theme.of(context).textTheme;

//     return Scaffold(
//       backgroundColor: colors.primary,
//       body: SafeArea(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Text(
//               'Partida de Memorama',
//               style: TextStyle(
//                 fontSize: 28,
//                 color: colors.primary,
//               ),
//             ),
//           ),
//           GameButton(
//             title: 'Comenzar',
//             onPressed: () {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(
//                   builder: (BuildContext context) {
//                     return const MemoryMatchPage();
//                   },
//                 ),
//               );
//             },
//           )
//         ],
//       )),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/utils/constants.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/widgets/game_options.dart';
import 'package:sizer/sizer.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                gameTitle,
                style: TextStyle(fontSize: 24, color: colors.primary),
              ),
              GameOptions(),
              SizedBox(
                height: 1.h,
              ),
              // FloatingActionButton(
              //   heroTag: 'floating3',
              //   onPressed: () {
              //     // Menu Principal
              //     Navigator.pushReplacementNamed(context, '/login');
              //   },
              //   child: Icon(Icons.arrow_back),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
