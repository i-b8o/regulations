import 'package:flutter/material.dart';

import 'bottom_bar_black_divider.dart';
import 'bottom_bar_black_icon.dart';
import 'bottom_bar_black_top.dart';

class BottomBarBlack extends StatelessWidget {
  const BottomBarBlack({
    Key? key,
    required this.height,
    required this.iconSize,
  }) : super(key: key);
  final double height, iconSize;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            color: Colors.black.withOpacity(0.9)),
        width: MediaQuery.of(context).size.width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BottomBarBlackTop(height: height),
            Container(
              height: height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _buildBottomBarBlack(iconSize),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBottomBarBlack(double fontHeight) {
    return [
      BottomBarBlackIcon(height: fontHeight, icon: Icons.content_copy),
      BottomBarBlackDivider(height: fontHeight),
      BottomBarBlackIcon(height: fontHeight, icon: Icons.format_underline),
      BottomBarBlackDivider(height: fontHeight),
      BottomBarBlackIcon(height: fontHeight, icon: Icons.format_underline),
      BottomBarBlackDivider(height: fontHeight),
      BottomBarBlackIcon(height: fontHeight, icon: Icons.edit),
      BottomBarBlackDivider(height: fontHeight),
      BottomBarBlackIcon(
        height: fontHeight,
        icon: Icons.keyboard_arrow_down,
      ),
    ].toList();
  }
}
