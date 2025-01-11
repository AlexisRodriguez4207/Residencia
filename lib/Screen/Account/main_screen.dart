import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';

import 'package:sizer/sizer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          _ImageBoxSuperior(size: size),
          _BoxInferior(),
          Positioned(
            top: size.height * 0.55,
            left: size.width * 0.1,
            child: SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.4,
              child: Column(children: [
                SizedBox(
                  width: size.width * 0.6,
                  child: Text(
                    'MindTech',
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: size.width * 0.6,
                  child: Text(
                    'Aplicación de desarrollo de Residencia',
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.3,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text('Iniciar Sesión')),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text('Registrarse'),
                  style: ButtonStyle(
                    //  Mismo tamaño para todos los botones
                    padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageBoxSuperior extends StatelessWidget {
  const _ImageBoxSuperior({
    // super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: size.width * 0.1,
      top: size.height * 0.1,
      right: size.width * 0.1,
      child: SizedBox(
        height: size.height * 0.35,
        width: size.width * 0.8,
        // Revisar este apartado porque no cargan las imagenes
        // child: UnDraw(
        //     illustration: UnDrawIllustration.reminders,
        //     placeholder: Text('Cargando...'),
        //     errorWidget: Icon(Icons.error),
        //     color: const Color(0xff1a1e3e)),
      ),
    );
  }
}

class _BoxInferior extends StatelessWidget {
  const _BoxInferior({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _BoxPainter(),
      ),
    );
  }
}

class _BoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint();
    paint.color = const Color.fromRGBO(26, 30, 62, 1);
    paint.strokeWidth = 50;
    paint.style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
        0, size.height * 0.5, size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height * 0.5);
    path.quadraticBezierTo(
        size.width, size.height * 0.5, size.width, size.height * 0.4);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
