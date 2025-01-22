import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:residencia_v2/Config/Services/theme_provider.dart';
import 'package:residencia_v2/Config/Theme/theme.dart';
import 'package:residencia_v2/Screen/Navbar%20Dashboard/bottom_nav_btn.dart';
import 'package:residencia_v2/Screen/Navbar%20Dashboard/clipper.dart';
import 'package:residencia_v2/Screen/Navbar%20Dashboard/constants.dart';
import 'package:residencia_v2/Screen/Navbar%20Dashboard/size_config.dart';
import 'package:sizer/sizer.dart';

class GamesInfo extends StatefulWidget {
  const GamesInfo({super.key});

  @override
  State<GamesInfo> createState() => _GamesInfoState();
}

class _GamesInfoState extends State<GamesInfo> {
  int _currentIndex = 0;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ThemeProvider>(context, listen: true).themeData;

    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;

    AppSizes().initSizes(context);

    return Scaffold(
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FloatingActionButton(
          heroTag: 'floating1',
          onPressed: () {
            // Cambiar Tema
            Provider.of<ThemeProvider>(context, listen: false).switchTheme();
          },
          child: Icon(
              provider == lightTheme ? Icons.sunny : Icons.mode_night_rounded),
        ),
        SizedBox(height: 3.h),
        SizedBox(height: 2.h),

        // SizedBox(height: 0.h),
      ]),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Minijuegos'),
        actions: [
          IconButton(
            onPressed: () {
              //Cerrar sesion
              _auth.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                'Información Acerca de los Minijuegos',
                style: TextStyle(color: colors.primary, fontSize: 20),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 300,
                height: 170,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color.fromARGB(255, 224, 219, 219),
                      const Color.fromARGB(255, 162, 202, 235)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Ahorcado: \nJugar ahorcado desarrolla habilidades de lenguaje, atención, concentración y memoria. También ayuda a mejorar el vocabulario y la ortografía.',
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.only(left: 15),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 300,
                height: 160,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color.fromARGB(255, 224, 219, 219),
                      const Color.fromARGB(255, 162, 202, 235)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Memorama: \nJugar al memorama desarrolla habilidades cognitivas, mejorar la memoria visual, la atención, la concentración y la coordinación visomotora.',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.start,
                ),
                padding: EdgeInsets.only(left: 15),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              _buildBottomNavBar()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSizes.blockSizeHorizontal * 4.5,
        0,
        AppSizes.blockSizeHorizontal * 4.5,
        70,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          width: AppSizes.screenWidth,
          height: AppSizes.blockSizeHorizontal * 18,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              // Lista de navegacion inferior
              Positioned(
                bottom: 0,
                top: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomNavBtn(
                      icon: IconlyLight.home,
                      currentIndex: _currentIndex,
                      index: 0,
                      onPressed: (val) {
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    ),
                    BottomNavBtn(
                      icon: IconlyLight.chat,
                      currentIndex: _currentIndex,
                      index: 1,
                      onPressed: (val) {
                        Navigator.pushReplacementNamed(context, '/notes');

                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    ),
                    BottomNavBtn(
                      icon: IconlyLight.search,
                      currentIndex: _currentIndex,
                      index: 2,
                      onPressed: (val) {
                        Navigator.pushReplacementNamed(context, '/maps');

                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    ),
                    BottomNavBtn(
                      icon: IconlyLight.game,
                      currentIndex: _currentIndex,
                      index: 3,
                      onPressed: (val) {
                        Navigator.pushReplacementNamed(context, '/gamesMenu');

                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    ),
                    BottomNavBtn(
                      icon: IconlyLight.profile,
                      currentIndex: _currentIndex,
                      index: 4,
                      onPressed: (val) {
                        Navigator.pushReplacementNamed(context, '/profile');
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    ),
                  ],
                ),
              ),

              // Indicador de item seleccionado
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate,
                left: AnimatedPositionedLeftValue(_currentIndex),
                child: Column(
                  children: [
                    Container(
                      height: AppSizes.blockSizeHorizontal * 1.0,
                      width: AppSizes.blockSizeHorizontal * 12,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        height: AppSizes.blockSizeHorizontal * 15,
                        width: AppSizes.blockSizeHorizontal * 12,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradient,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
