import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:regulation/paragraph/widgets/table.dart';
import 'package:regulation_api/regulation_api.dart';

class ParagraphCard extends StatelessWidget {
  const ParagraphCard({Key? key, required this.paragraph}) : super(key: key);
  final Paragraph paragraph;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0XFFFAFAFA),
      margin: EdgeInsets.zero,
      child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: paragraph.isTable
              ? SingleChildScrollView(
                  padding: EdgeInsets.all(2),
                  scrollDirection: Axis.horizontal,
                  child: ParagraphTable(paragraph: paragraph)
                    
                ) : paragraph.isHTML ?
                HtmlWidget(
                          paragraph.content,
                        )
              : Text(paragraph.content)),
    );
  }
}
