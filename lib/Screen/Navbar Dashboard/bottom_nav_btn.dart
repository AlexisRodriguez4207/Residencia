import 'package:flutter/material.dart';
import 'package:residencia_v2/Screen/Navbar%20Dashboard/size_config.dart';

class BottomNavBtn extends StatelessWidget {
  const BottomNavBtn(
      {super.key,
      required this.icon,
      required this.index,
      required this.currentIndex,
      required this.onPressed});

  final IconData icon;
  final int index;
  final int currentIndex;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    AppSizes().initSizes(context);
    return InkWell(
      onTap: () {
        onPressed(index);
      },
      child: Container(
          height: AppSizes.blockSizeHorizontal * 13,
          width: AppSizes.blockSizeHorizontal * 17,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Black Icon
              (currentIndex == index)
                  ? Positioned(
                      left: AppSizes.blockSizeHorizontal * 4,
                      bottom: AppSizes.blockSizeHorizontal * 1.5,
                      child: Icon(
                        icon,
                        color: Colors.black,
                        size: AppSizes.blockSizeHorizontal * 8,
                      ),
                    )
                  : Container(),

              //Main yellow Icon
              AnimatedOpacity(
                opacity: (currentIndex == index) ? 1 : 1,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: AppSizes.blockSizeHorizontal * 8,
                ),
              ),
            ],
          )),
    );
  }
}
