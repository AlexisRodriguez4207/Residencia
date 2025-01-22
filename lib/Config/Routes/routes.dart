import 'package:residencia_v2/Screen/Account/Main_Screen.dart';
import 'package:residencia_v2/Screen/Account/login_screen.dart';
import 'package:residencia_v2/Screen/Account/register_screen.dart';
import 'package:residencia_v2/Screen/Modules/Games/Memorama/memory_match_game.dart';
import 'package:residencia_v2/Screen/Modules/Games/ahorcado.dart';
import 'package:residencia_v2/Screen/Modules/Games/game_screen.dart';
import 'package:residencia_v2/Screen/Modules/Perfil/profile.dart';
import 'package:residencia_v2/Screen/Modules/infogames.dart';
import 'package:residencia_v2/Screen/Modules/maps.dart';
import 'package:residencia_v2/Screen/Modules/notes.dart';
import 'package:residencia_v2/Screen/TestNavbar.dart';
import 'package:residencia_v2/Screen/dashboard.dart';

final routes = {
  'main': (context) => const MainScreen(),
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/dashboard': (context) => const Dashboard(),
  '/notes': (context) => const Notes(),
  '/maps': (context) => const MapScreen(),
  '/gamesMenu': (context) => const GamesMenu(),
  '/memorama': (context) => const TheMemoryMatchGame(),
  '/hang': (context) => const Hangman(),
  '/info': (context) => const GamesInfo(),
  '/profile': (context) => UserProfile(),
  '/test': (context) => const App(),
};
