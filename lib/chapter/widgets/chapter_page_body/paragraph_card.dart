import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../../constants.dart';

import 'package:regulation_api/regulation_api.dart';


import 'paragraph_table.dart';
import 'paragraph_text.dart';



enum ParagraphClass { right, center, indent, none }

class ParagraphCard extends StatelessWidget {
  const ParagraphCard({Key? key, required this.paragraph,}) : super(key: key);
  final Paragraph paragraph;
  

  @override
  Widget build(BuildContext context) {
    ParagraphClass pClass;
    switch (paragraph.paragraphClass) {
      case 'align_right': 
        pClass = ParagraphClass.right;
        break;
      case 'align_center':
        pClass = ParagraphClass.center;
        break;
      case 'indent':
        pClass = ParagraphClass.indent;
        break;
      default:
        pClass = ParagraphClass.none;
    };
    return Card(
      shadowColor : Colors.transparent,
      color: Constants.bodyColor,
      margin: EdgeInsets.zero,
      child: pClass == ParagraphClass.indent ? SizedBox(height: 15,) :  buildCard(pClass),
    );
  }

  Container buildCard(ParagraphClass pClass) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: pClass == ParagraphClass.none ? 16.0 : 2.0),
        child: paragraph.isNFT ?
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: HtmlWidget(
            paragraph.content,
            customStylesBuilder: (element) => {
            'font-family': 'Courier New,"Monospace"',
            'white-space': 'pre',
            'font-size': '17.5px',
            'letter-spacing': '0',
            'line-height': '5px',
            'font-weight': '500',
          },),
          
        ) :
        paragraph.isTable
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ParagraphTable(paragraph: paragraph))
            : paragraph.isHTML
                ? HtmlWidget(
                    paragraph.content,
                    customStylesBuilder: pClass == ParagraphClass.none ? null :  (element) {return { 'text-align': pClass == ParagraphClass.right ? 'right' : 'center'};},
                  )
                : ParagraphText(paragraph: paragraph, pClass: pClass,));
  }

}

