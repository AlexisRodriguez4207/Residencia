import 'package:flutter/material.dart';
import 'package:residencia_v2/Screen/Navbar%20Dashboard/final_view.dart';

Future<void> main() async => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Banner(
        message: 'FlexZ',
        location: BannerLocation.bottomStart,
        child: FinalView(),
      ),
    );
  }
}
