import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:html/parser.dart';
import 'package:regulation_repository/regulation_repository.dart';

import 'bloc/edit_paragraph_bloc.dart';
import 'bottom_bar_black/bottom_bar_black.dart';
import 'bottom_bar_white/bottom_bar_white.dart';

class EditParagraphPage extends StatelessWidget {
  const EditParagraphPage({Key? key, required String text})
      : _text = text,
        super(key: key);
  final String _text;

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _padding = 15;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
          height: double.infinity,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + _padding,
          ),
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              return Stack(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SelectableText(
                    _parseHtmlString(_text),
                    toolbarOptions: ToolbarOptions(copy: true),
                  ),
                ),
                BottomBarBlack(
                  iconSize: orientation == Orientation.portrait
                      ? _height * 0.02
                      : _height * 0.04,
                  height: orientation == Orientation.portrait
                      ? _height * 0.4
                      : _height * 0.6,
                ),
                BottomBarWhite(
                  height: orientation == Orientation.portrait
                      ? _height * 0.32
                      : _height * 0.48,
                )
              ]);
            },
          )),
    );
  }
}
