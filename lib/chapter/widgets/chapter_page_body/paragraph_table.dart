import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:regulation_api/regulation_api.dart';

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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.zoom_out_map_rounded,
                    size: size.width < size.height
                        ? size.width * 0.1
                        : size.height * 0.1,
                    
                  ),
                  SizedBox(height: size.width * 0.05,),
                  Center(
                      child: Text(
                    "Нажмите, чтобы развернуть.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  )),
                  // Image.asset(
                  //   // TODO make svg
                  //   "assets/images/table.png",
                  // width: size.width < size.height
                  //     ? size.width * 0.1
                  //     : size.height * 0.1,
                  // height: size.width < size.height
                  //     ? size.width * 0.1
                  //     : size.height * 0.1,
                  // ),
                  // Flexible(
                  //     child: Text(
                  //   "Нажмите, чтобы развернуть. Прокручивайте таблицу горизонтально.",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(fontWeight: FontWeight.w100,
                  //       color: Theme.of(context).primaryColor,),

                  // ))
                ],
              ),
            ),
          )
        : Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  color: Theme.of(context).textTheme.headline2!.backgroundColor,
                  child: HtmlWidget(widget.paragraph.content,
                  textStyle: Theme.of(context).textTheme.headline2,
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
                          Padding(
                            padding: EdgeInsets.only(top: 2.0),
                            child: Icon(
                              Icons.arrow_drop_up,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
                          Text("Свернуть",
                              style: TextStyle(
                                  color: Theme.of(context).iconTheme.color,
                                  fontWeight: FontWeight.w400))
                        ],
                      )),
                ],
              )
            ],
          );
  }
}
