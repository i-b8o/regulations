import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:regulation_api/regulation_api.dart';

class ParagraphTable extends StatelessWidget {
  const ParagraphTable({
    Key? key,
    required this.paragraph,
  }) : super(key: key);

  final Paragraph paragraph;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(paragraph.content,
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
    });
  }
}
