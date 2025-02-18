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

class GamesMenu extends StatefulWidget {
  const GamesMenu({super.key});

  @override
  State<GamesMenu> createState() => _GamesMenuState();
}

class _GamesMenuState extends State<GamesMenu> {
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
        SizedBox(height: 2.h),
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
                'Bienvenido a la pantalla de Minijuegos',
                style: TextStyle(color: colors.primary, fontSize: 20),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/hangman.png",
                    ),
                  ),
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 27.h,
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[800]),
                        onPressed: () {
                          //Registro de usuario
                          Navigator.pushReplacementNamed(context, '/hang');
                        },
                        child: Text('Ahorcado',
                            style: TextStyle(
                              color: colors.primary,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/memorama.png",
                    ),
                  ),
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 27.h,
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[800]),
                        onPressed: () {
                          //Registro de usuario
                          Navigator.pushReplacementNamed(context, '/memorama');
                        },
                        child: Text('Memorama',
                            style: TextStyle(
                              color: colors.primary,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    //Registro de usuario
                    Navigator.pushReplacementNamed(context, '/info');
                  },
                  child: Text('Información',
                      style: TextStyle(color: colors.primary)),
                ),
              ),
              SizedBox(
                height: 6.h,
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
