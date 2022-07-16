import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:regulation_api/regulation_api.dart';

import '../../../constants.dart';

class ParagraphTable extends StatefulWidget {
  const ParagraphTable({
    Key? key,
    required this.paragraph,
  }) : super(key: key);

  final Paragraph paragraph;

  @override
  State<ParagraphTable> createState() => _ParagraphTableState();
}

class _ParagraphTableState extends State<ParagraphTable> {
  bool minimized = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return minimized
        ? GestureDetector(
            onTap: () {
              setState(() {
                minimized = false;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  // TODO make svg
                  "assets/images/table.png",
                  width: size.width < size.height
                      ? size.width * 0.2
                      : size.height * 0.2,
                  height: size.width < size.height
                      ? size.width * 0.2
                      : size.height * 0.2,
                ),
                Flexible(
                    child: Text(
                  "Нажмите, чтобы развернуть. Прокручивайте таблицу горизонтально.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Constants.btnColor),
                ))
              ],
            ),
          )
        : Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: HtmlWidget(widget.paragraph.content,
                    customStylesBuilder: (element) {
                  switch (element.localName) {
                    case 'table':
                      return {
                        'border': '1px solid',
                        'border-collapse': 'collapse',
                        'font-size': '16px',
                        'line-height': '18px',
                        'letter-spacing': '0',
                        'font-weight': '400',
                        'font-family': 'Times New Roman',
                      };
                    case 'td':
                      return {'border': '1px solid', 'vertical-align': 'top'};
                  }
                  if (element.className.contains('align_center')) {
                    return {'text-align': 'center', 'width': '100%'};
                  }

                  return null;
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          minimized = true;
                        });
                      },
                      child: Row(
                        children: [
                          Text("Свернуть",
                              style: TextStyle(
                                  color: Constants.btnColor)),
                          Icon(
                            Icons.arrow_drop_up,
                            color:
                                Constants.btnColor,
                          )
                        ],
                      )),
                ],
              )
            ],
          );
  }
}
