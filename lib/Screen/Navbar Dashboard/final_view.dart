import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:residencia_v2/Screen/Navbar%20Dashboard/bottom_nav_btn.dart';
import 'package:residencia_v2/Screen/Navbar%20Dashboard/clipper.dart';
import 'package:residencia_v2/Screen/Navbar%20Dashboard/constants.dart';
import 'package:residencia_v2/Screen/Navbar%20Dashboard/size_config.dart';
import 'package:sizer/sizer.dart';

class FinalView extends StatefulWidget {
  const FinalView({super.key});

  @override
  State<FinalView> createState() => _FinalViewState();
}

class _FinalViewState extends State<FinalView> {
  int _currentIndex = 0;
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void animatetoPage(int page) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var texts = Theme.of(context).textTheme;
    AppSizes().initSizes(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: colors.primary),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // ElevatedButton(
              //     onPressed: () {
              //       //Registro de usuario
              //       Navigator.pushReplacementNamed(context, '/notes');
              //     },
              //     child: const Text('Notas')),
              // ElevatedButton(
              //     onPressed: () {
              //       //Registro de usuario
              //       Navigator.pushReplacementNamed(context, '/maps');
              //     },
              //     child: const Text('Ubicación')),
              // ElevatedButton(
              //     onPressed: () {
              //       //Registro de usuario
              //       Navigator.pushReplacementNamed(context, '/gamesMenu');
              //     },
              //     child: const Text('Juegos')),
              SizedBox(
                height: 49.h,
              ),
              _buildBottomNavBar()
              // Positioned.fill(
              //   child: Container(),
              // ),
              // Positioned(
              //   bottom: 0,
              //   right: 0,
              //   left: 0,
              //   child: _buildBottomNavBar(),
              // )
            ],
          )),
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
                        animatetoPage(val);
                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    ),
                    // IconButton(
                    //     onPressed: () {
                    //       Navigator.pushReplacementNamed(context, '/notes');
                    //     },
                    //     icon: Icon(Icons.error)),
                    // BottomNavBtn(
                    //   icon: IconlyLight.search,
                    //   currentIndex: _currentIndex,
                    //   index: 1,
                    //   onPressed: (val) {
                    //     animatetoPage(val);

                    //     setState(() {
                    //       _currentIndex = val;
                    //     });
                    //   },
                    // ),
                    BottomNavBtn(
                      icon: IconlyLight.category,
                      currentIndex: _currentIndex,
                      index: 2,
                      onPressed: (val) {
                        Navigator.pushReplacementNamed(context, '/notes');

                        setState(() {
                          _currentIndex = val;
                        });
                      },
                    ),
                    BottomNavBtn(
                      icon: IconlyLight.setting,
                      currentIndex: _currentIndex,
                      index: 3,
                      onPressed: (val) {
                        animatetoPage(val);

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
                        animatetoPage(val);

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
