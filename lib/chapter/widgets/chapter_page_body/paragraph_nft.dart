import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:regulation_api/regulation_api.dart';

class ParagraphNFT extends StatelessWidget {
  final Paragraph paragraph;

  const ParagraphNFT({super.key, required this.paragraph});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:10.0),
        child: HtmlWidget(
          paragraph.content,
          customStylesBuilder: (element) => {
            'font-family': 'Courier New,"Monospace"',
            'white-space': 'pre',
            'font-size': '17.5px',
            'letter-spacing': '0',
            'line-height': '5px',
            'font-weight': '500',
          },
        ),
      ),
    );
  }
}
