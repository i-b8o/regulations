import 'package:flutter/material.dart';
import 'bottom_bar_white_circle.dart';

const List<int> colors = [
  0xFF525965,
  0xFFffa200,
  0xFFff3063,
  0xFF00d2b0,
  0xFF8963ff,
  0xFF007fff,
];

class BottomBarWhiteColorsListView extends StatelessWidget {
  const BottomBarWhiteColorsListView({Key? key, required this.height})
      : super(key: key);
  final double height;

  BottomBarWhiteCircle _circlesBuilder(int colorInt) {
    return BottomBarWhiteCircle(height: height, color: Color(colorInt));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.15,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.07),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => index != colors.length
            ? _circlesBuilder(colors[index])
            : Container(
                width: height * 0.15,
                height: height * 0.15,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFF8d8d8d)),
                    shape: BoxShape.circle,
                    color: Color(0xFFf9f9f9)),
                child: Icon(
                  Icons.add,
                  color: Color(0xFF8d8d8d),
                )),
        itemCount: colors.length + 1,
        separatorBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
      ),
    );
  }
}
