import 'package:residencia_v2/Screen/Account/Main_Screen.dart';
import 'package:residencia_v2/Screen/Account/login_screen.dart';
import 'package:residencia_v2/Screen/Account/register_screen.dart';
import 'package:residencia_v2/Screen/Modules/notes.dart';
import 'package:residencia_v2/Screen/dashboard.dart';

final routes = {
  'main': (context) => const MainScreen(),
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/dashboard': (context) => const Dashboard(),
  '/notes': (context) => const Notes(),
};
