import 'package:flutter/material.dart';

import 'bottom_bar_white_colors_list_view.dart';
import 'bottom_bar_white_text.dart';
import 'color_picker/color_picker.dart';

class BottomBarWhite extends StatelessWidget {
  BottomBarWhite({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;
  Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              color: Theme.of(context).textTheme.headline2!.backgroundColor),
          width: MediaQuery.of(context).size.width,
          height: height,
          child: Column(children: [
            SizedBox(
              height: height * 0.1,
            ),
            BottomBarWhiteText(height: height),
            SizedBox(
              height: height * 0.1,
            ),
            BottomBarWhiteColorsListView(
              height: height,
            ),
            RegulationsColorPicker(MediaQuery.of(context).size.width * 0.7, )
          ]),
        ));
  }
}

