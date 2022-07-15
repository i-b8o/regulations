import 'package:flutter/material.dart';
import 'package:regulation_api/regulation_api.dart';

import 'paragraph_card.dart';


class ParagraphText extends StatelessWidget {
  const ParagraphText({
    Key? key,
    required this.paragraph, required this.pClass,
  }) : super(key: key);

  final Paragraph paragraph;
  final ParagraphClass pClass;

  @override
  Widget build(BuildContext context) {

    return pClass == ParagraphClass.right ? Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Text(paragraph.content)],
      ) : pClass == ParagraphClass.center ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Flexible(child: Text(paragraph.content, textAlign: TextAlign.center,))],
      ) : Text(paragraph.content);  


  }
}
