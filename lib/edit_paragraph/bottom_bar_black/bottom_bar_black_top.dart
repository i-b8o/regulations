import 'package:flutter/material.dart';

class BottomBarBlackTop extends StatelessWidget {
  const BottomBarBlackTop({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.1,
      child: Column(children: [
        SizedBox(
          height: height * 0.01,
        ),
        Container(
          height: 1,
          width: 33,
          color: Color(0xFF5d5d5d),
        ),
        Container(
          height: 2,
          width: 35,
          color: Color(0xFF777777),
        ),
        Container(
          height: 1,
          width: 33,
          color: Color(0xFF5d5d5d),
        ),
      ]),
    );
  }
}
