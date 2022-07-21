import 'package:flutter/material.dart';

class BottomBarBlack extends StatelessWidget {
  const BottomBarBlack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            color: Colors.black.withOpacity(0.9)),
        width: _width,
        height: _height * 0.3,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TODO refactor all to widget
              Container(
                height: _height * 0.05,
                child: Icon(
                  Icons.content_copy,
                  color: Theme.of(context).appBarTheme.toolbarTextStyle!.color,
                ),
              ),
              Container(
                width: 1,
                height: _height * 0.01,
                color: Theme.of(context).appBarTheme.toolbarTextStyle!.color,
              ),
              Container(
                child: Icon(
                  Icons.format_underline,
                  color: Theme.of(context).appBarTheme.toolbarTextStyle!.color,
                ),
              ),
              Container(
                width: 1,
                height: _height * 0.01,
                color: Theme.of(context).appBarTheme.toolbarTextStyle!.color,
              ),
              Container(),
              Container(
                width: 1,
                height: _height * 0.01,
                color: Theme.of(context).appBarTheme.toolbarTextStyle!.color,
              ),
              Container(),
              Container(
                width: 1,
                height: _height * 0.01,
                color: Theme.of(context).appBarTheme.toolbarTextStyle!.color,
              ),
              
              Container(
                height: _height * 0.05,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Theme.of(context).appBarTheme.toolbarTextStyle!.color,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
