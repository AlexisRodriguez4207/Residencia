import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:residencia_v2/Config/Preferences/shared_preferences.dart';
import 'package:residencia_v2/Config/Routes/routes.dart';
import 'package:residencia_v2/Config/Services/theme_provider.dart';
import 'package:residencia_v2/firebase_options.dart';

import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
  // child: const TheMemoryMatchGame(
  // runApp(ProviderScope(
  //   child: const MyApp(),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (p0, p1, p2) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          navigatorObservers: [FlutterSmartDialog.observer],
          builder: FlutterSmartDialog.init(),
          theme: Provider.of<ThemeProvider>(context).themeData,
          initialRoute: '/dashboard',
          routes: routes,
        );
      },
    );
  }
}
