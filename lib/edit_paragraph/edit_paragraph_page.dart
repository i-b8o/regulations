import 'package:flutter/material.dart';

import 'bottom_bar_black.dart';

class EditParagraphPage extends StatelessWidget {
  const EditParagraphPage({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double _padding = 15;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
          height: double.infinity,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + _padding,
          ),
          child: Stack(children: [
            SelectableText(text),
            BottomBarBlack(),
            Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                      color: Colors.white),
                  width: _width,
                  height: _height * 0.24,
                ))
          ])),
    );
  }
}
