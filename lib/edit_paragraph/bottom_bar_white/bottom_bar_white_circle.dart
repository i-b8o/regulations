import 'package:flutter/material.dart';

class BottomBarWhiteCircle extends StatelessWidget {
  const BottomBarWhiteCircle({
    Key? key,
    required this.height,
    required this.color,
    this.isActive = false,
  }) : super(key: key);

  final double height;
  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height * 0.15,
      height: height * 0.15,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: isActive
          ? Icon(
              Icons.check,
              color: Colors.white,
            )
          : Container(),
    );
  }
}
